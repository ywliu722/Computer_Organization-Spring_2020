/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps
module Simple_Single_CPU(
	input clk_i,
	input rst_i
	);

wire [31:0] pc_o;
wire [31:0] instr;
wire RegWrite;
wire [31:0] RSdata_o;
wire [31:0] RTdata_o;
wire [31:0] ALUresult;
wire MemRead,MemWrite;
wire MemtoReg;
wire [1:0]ALUOp;
wire [1:0]Jump;
wire [31:0] DM_o;

wire [31:0] pc_p4;
wire [31:0] pc_imm;
wire [31:0] sl_1;
reg PCSrc;

wire [3:0] ALUCtrl;
wire [31:0] ImmResult;
wire [31:0] ALUSrc2;
wire ALUcout;
wire ALUoverflow;
wire ALUzero;

wire [31:0]PCSrc1_o;
wire [31:0]nextPC;
wire [31:0]WriteBack;
wire [31:0]WB_o;

ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_i(nextPC) ,   
	    .pc_o(pc_o) 
	    );

Instr_Memory IM(
        .addr_i(pc_o),  
	    .instr_o(instr)    
	    );		

Reg_File RF(
        .clk_i(clk_i),      
	    .rst_i(rst_i) ,     
        .RSaddr_i(instr[19:15]) ,  
        .RTaddr_i(instr[24:20]) ,  
        .RDaddr_i(instr[11:7]) ,  
        .RDdata_i(WB_o)  , 
        .RegWrite_i (RegWrite),
        .RSdata_o(RSdata_o) ,  
        .RTdata_o(RTdata_o)   
        );		

Data_Memory Data_Memory(
		.clk_i(clk_i),
		.addr_i(ALUresult),
		.data_i(RTdata_o),
		.MemRead_i(MemRead),
		.MemWrite_i(MemWrite),
		.data_o(DM_o)
		);
		
Decoder Decoder(
        .instr_i(instr), 
		.ALUSrc(ALUSrc),
		.MemtoReg(MemtoReg),
	    .RegWrite(RegWrite),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
	    .Branch(Branch),
		.ALUOp(ALUOp),
		.Jump(Jump)
	    );
		
//for PC+4
Adder Adder1(
        .src1_i(pc_o),     
	    .src2_i(4),     
	    .sum_o(pc_p4)    
	    );
		
Imm_Gen ImmGen(
		.instr_i(instr),
		.Imm_Gen_o(ImmResult)
		);
	
Shift_Left_1 SL1(
		.data_i(ImmResult),
		.data_o(sl_1)
		);
	
//for ALUSrc
MUX_2to1 Mux_ALUSrc(
		.data0_i(RTdata_o),       
		.data1_i(ImmResult),
		.select_i(ALUSrc),
		.data_o(ALUSrc2)
		);
			
reg [3:0]control_in;
always@(*)begin
control_in[3] = instr[30];
control_in[2] = instr[14];
control_in[1] = instr[13];
control_in[0] = instr[12];
end
ALU_Ctrl ALU_Ctrl(
		.instr(control_in),
		.ALUOp(ALUOp),
		.ALU_Ctrl_o(ALUCtrl)
		);
		
//for PC+imm<<1
Adder Adder2(
        .src1_i(pc_o),     
	    .src2_i(sl_1),     
	    .sum_o(pc_imm)    
	    );
		
alu alu(
		.rst_n(rst_i),
		.src1(RSdata_o),
		.src2(ALUSrc2),
		.ALU_control(ALUCtrl),
		.zero(ALUzero),
		.result(ALUresult),
		.cout(ALUcout),
		.overflow(ALUoverflow)
		);
	
always@(*)begin
	case(control_in[2:0])
		3'b001: PCSrc = Branch & !ALUzero; //bne
		3'b000: PCSrc = Branch & ALUzero; //beq
		3'b100: PCSrc = Branch & ALUresult[0];//blt
		3'b101: PCSrc = Branch & !ALUresult[0];//bge
		default: PCSrc = 0;
	endcase
end
//for PCSrc
MUX_2to1 Mux_PCSrc1(
		.data0_i(pc_p4),       
		.data1_i(pc_imm),
		.select_i(PCSrc),
		.data_o(PCSrc1_o)
		);

//for PCSrc
MUX_3to1 Mux_PCSrc2(
		.data0_i(PCSrc1_o),       
		.data1_i(sl_1),
		.data2_i(RSdata_o),
		.select_i(Jump),
		.data_o(nextPC)
		);
		
//for MemtoReg
MUX_2to1 Mux_MemtoReg(
		.data0_i(ALUresult),       
		.data1_i(DM_o),
		.select_i(MemtoReg),
		.data_o(WriteBack)
		);



//for Reg write data
MUX_3to1 Mux_RegWriteData(
		.data0_i(WriteBack),       
		.data1_i(pc_p4),
		.data2_i(0),
		.select_i(Jump),
		.data_o(WB_o)
		);
		
endmodule
		  


