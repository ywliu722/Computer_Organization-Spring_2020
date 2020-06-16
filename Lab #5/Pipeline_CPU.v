/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps
module Pipeline_CPU(
	input clk_i,
	input rst_i
	);
//IF
wire [31:0] IF_pc_o;
wire [31:0] IF_next_PC;
wire [31:0] IF_instruction;
wire [31:0] IF_pc_p4;

//ID
wire [31:0] ID_instruction;
wire [31:0] ID_PC;
wire [31:0] ID_RSdata_o;
wire [31:0] ID_RTdata_o;

wire	    ID_ALUSrc;
wire 	    ID_MemtoReg;
wire	    ID_RegWrite;
wire	    ID_MemRead;
wire	    ID_MemWrite;
wire	    ID_Branch;
wire [1:0]  ID_ALUop;

wire [31:0] ID_Imm;

//EX
wire [31:0] EX_PC;
wire [31:0] EX_RSdata_o;
wire [31:0] EX_RTdata_o;

wire	    EX_ALUSrc;
wire 	    EX_MemtoReg;
wire	    EX_RegWrite;
wire	    EX_MemRead;
wire	    EX_MemWrite;
wire	    EX_Branch;
wire [1:0]  EX_ALUop;

wire [31:0] EX_Imm;
wire [31:0] EX_Imm_SL;
wire [31:0] EX_PCimm;
wire [3:0]  EX_ALUcontrol_in;
wire [3:0]  EX_ALUcontrol_out;

wire [31:0] EX_ALUSrc1;
wire [31:0] EX_ALUSrc2;

wire	    EX_zero;
wire	    EX_cout;
wire	    EX_overflow;
wire [31:0] EX_ALUresult;

wire [4:0]  EX_RS1;
wire [4:0]  EX_RS2;
wire [4:0]  EX_RD;

wire [1:0] MUX1_select;
wire [1:0] MUX2_select;

//MEM
reg	    MEM_PCSrc;
wire [31:0] MEM_PCimm;

wire	    MEM_RegWrite;
wire	    MEM_MemtoReg;
wire	    MEM_Branch;
wire	    MEM_MemRead;
wire	    MEM_MemWrite;

wire	    MEM_zero;
wire [31:0] MEM_ALUresult;
wire [31:0] MEM_RTdata_o;
wire [31:0] MEM_Data;

wire [4:0]  MEM_RD;
wire [2:0]  MEM_Btype;

//WD
wire	    WB_RegWrite;
wire	    WB_MemtoReg;

wire [31:0] WB_Data;
wire [31:0] WB_ALUresult;

wire [4:0]  WB_RD;
wire [31:0] WB_WriteBack;



//IF
ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_i(IF_next_PC) ,   
	    .pc_o(IF_pc_o) 
	    );

Instr_Memory IM(
        .addr_i(IF_pc_o),  
	    .instr_o(IF_instruction)    
	    );		
//for PC+4
Adder Adder1(
        .src1_i(IF_pc_o),     
	    .src2_i(4),     
	    .sum_o(IF_pc_p4)    
	    );

//for PCSrc
MUX_2to1 Mux_PCSrc1(
		.data0_i(IF_pc_p4),       
		.data1_i(MEM_PCimm),
		.select_i(MEM_PCSrc),
		.data_o(IF_next_PC)
		);

Pipeline1_IFID_Reg Reg1(
		.clk_i(clk_i),
		.rst_i(rst_i),
		.instruction_in(IF_instruction),
		.PC_in(IF_pc_o),
		.instruction_out(ID_instruction),
		.PC_out(ID_PC)
			);

//ID
Reg_File RF(
        .clk_i(clk_i),      
	.rst_i(rst_i) ,     
        .RSaddr_i(ID_instruction[19:15]) ,  
        .RTaddr_i(ID_instruction[24:20]) ,  
        .RDaddr_i(WB_RD) ,  
        .RDdata_i(WB_WriteBack)  , 
        .RegWrite_i (WB_RegWrite),
        .RSdata_o(ID_RSdata_o),  
        .RTdata_o(ID_RTdata_o)   
        );		


		
Decoder Decoder(
        .instr_i(ID_instruction), 
	.ALUSrc(ID_ALUSrc),
	.MemtoReg(ID_MemtoReg),
	.RegWrite(ID_RegWrite),
	.MemRead(ID_MemRead),
	.MemWrite(ID_MemWrite),
	.Branch(ID_Branch),
	.ALUOp(ID_ALUop)
	    );
		

		
Imm_Gen ImmGen(
		.instr_i(ID_instruction),
		.Imm_Gen_o(ID_Imm)
		);

reg [3:0] ID_control_in;
always@(*)begin
ID_control_in[3] = ID_instruction[30];
ID_control_in[2] = ID_instruction[14];
ID_control_in[1] = ID_instruction[13];
ID_control_in[0] = ID_instruction[12];
end

Pipeline2_IDEX_Reg Reg2(
		.clk_i(clk_i),
		.rst_i(rst_i),
		.RegWrite_in(ID_RegWrite),
		.MemtoReg_in(ID_MemtoReg),
		.Branch_in(ID_Branch),
		.MemRead_in(ID_MemRead),
		.MemWrite_in(ID_MemWrite),
		.ALUop_in(ID_ALUop),
		.ALUSrc_in(ID_ALUSrc),
		.PC_in(ID_PC),
		.ReadData1_in(ID_RSdata_o),
		.ReadData2_in(ID_RTdata_o),
		.Immediate_in(ID_Imm),
		.ALUControl_in(ID_control_in),
		.RS1_in(ID_instruction[19:15]),
		.RS2_in(ID_instruction[24:20]),
		.RD_in(ID_instruction[11:7]),
		.RegWrite_out(EX_RegWrite),
		.MemtoReg_out(EX_MemtoReg),
		.Branch_out(EX_Branch),
		.MemRead_out(EX_MemRead),
		.MemWrite_out(EX_MemWrite),
		.ALUop_out(EX_ALUop),
		.ALUSrc_out(EX_ALUSrc),
		.PC_out(EX_PC),
		.ReadData1_out(EX_RSdata_o),
		.ReadData2_out(EX_RTdata_o),
		.Immediate_out(EX_Imm),
		.ALUControl_out(EX_ALUcontrol_in),
		.RS1_out(EX_RS1),
		.RS2_out(EX_RS2),
		.RD_out(EX_RD)
			);


//EX
Shift_Left_1 SL1(
		.data_i(EX_Imm),
		.data_o(EX_Imm_SL)
		);

Forwarding_Unit FU(
		.EX_RS1(EX_RS1),
		.EX_RS2(EX_RS2),
		.MEM_RD(MEM_RD),
		.WB_RD(WB_RD),
		.ALUSrc(EX_ALUSrc),
		.MEM_RegWrite(MEM_RegWrite),
		.WB_RegWrite(WB_RegWrite),
		.MUX1_select(MUX1_select),
		.MUX2_select(MUX2_select)
		   );

//for ALUSrc1
MUX_3to1 Mux_ALUSrc1(
		.data0_i(EX_RSdata_o),       
		.data1_i(MEM_ALUresult),
		.data2_i(WB_WriteBack),
		.select_i(MUX1_select),
		.data_o(EX_ALUSrc1)
		);

//for ALUSrc2
MUX_4to1 Mux_ALUSrc2(
		.data0_i(EX_RTdata_o),       
		.data1_i(MEM_ALUresult),
		.data2_i(WB_WriteBack),
		.data3_i(EX_Imm),
		.select_i(MUX2_select),
		.data_o(EX_ALUSrc2)
		);

ALU_Ctrl ALU_Ctrl(
		.instr(EX_ALUcontrol_in),
		.ALUOp(EX_ALUop),
		.ALU_Ctrl_o(EX_ALUcontrol_out)
		);
		
//for PC+imm<<1
Adder Adder2(
            .src1_i(EX_PC),     
	    .src2_i(EX_Imm_SL),     
	    .sum_o(EX_PCimm)    
	    );
		
alu alu(
		.rst_n(rst_i),
		.src1(EX_ALUSrc1),
		.src2(EX_ALUSrc2),
		.ALU_control(EX_ALUcontrol_out),
		.zero(EX_zero),
		.result(EX_ALUresult),
		.cout(EX_cout),
		.overflow(EX_overflow)
		);

Pipeline3_EXMEM_Reg Reg3(
		.clk_i(clk_i),
		.rst_i(rst_i),
		.RegWrite_in(EX_RegWrite),
		.MemtoReg_in(EX_MemtoReg),
		.Branch_in(EX_Branch),
		.MemRead_in(EX_MemRead),
		.MemWrite_in(EX_MemWrite),
		.PCimm_in(EX_PCimm),
		.zero_in(EX_zero),
		.ALUresult_in(EX_ALUresult),
		.ReadData2_in(EX_RTdata_o),
		.RD_in(EX_RD),
		.Btype_in(EX_ALUcontrol_in[2:0]),
		.RegWrite_out(MEM_RegWrite),
		.MemtoReg_out(MEM_MemtoReg),
		.Branch_out(MEM_Branch),
		.MemRead_out(MEM_MemRead),
		.MemWrite_out(MEM_MemWrite),
		.PCimm_out(MEM_PCimm),
		.zero_out(MEM_zero),
		.ALUresult_out(MEM_ALUresult),
		.ReadData2_out(MEM_RTdata_o),
		.RD_out(MEM_RD),
		.Btype_out(MEM_Btype)
    );


//MEM
Data_Memory Data_Memory(
		.clk_i(clk_i),
		.addr_i(MEM_ALUresult),
		.data_i(MEM_RTdata_o),
		.MemRead_i(MEM_MemRead),
		.MemWrite_i(MEM_MemWrite),
		.data_o(MEM_Data)
		);	
always@(*)begin
	case(MEM_Btype)
		3'b001: MEM_PCSrc = MEM_Branch & !MEM_zero; //bne
		3'b000: MEM_PCSrc = MEM_Branch & MEM_zero; //beq
		3'b100: MEM_PCSrc = MEM_Branch & MEM_ALUresult[0];//blt
		3'b101: MEM_PCSrc = MEM_Branch & !MEM_ALUresult[0];//bge
		default: MEM_PCSrc = 0;
	endcase
end

Pipeline4_MEMWB_Reg Reg4(
		.clk_i(clk_i),
		.rst_i(rst_i),
		.RegWrite_in(MEM_RegWrite),
		.MemtoReg_in(MEM_MemtoReg),
		.MemData_in(MEM_Data),
		.ALUresult_in(MEM_ALUresult),
		.RD_in(MEM_RD),
		.RegWrite_out(WB_RegWrite),
		.MemtoReg_out(WB_MemtoReg),
		.MemData_out(WB_Data),
		.ALUresult_out(WB_ALUresult),
		.RD_out(WB_RD)
    );


//WB		
//for MemtoReg
MUX_2to1 Mux_MemtoReg(
		.data0_i(WB_ALUresult),       
		.data1_i(WB_Data),
		.select_i(WB_MemtoReg),
		.data_o(WB_WriteBack)
		);
		
endmodule
		  


