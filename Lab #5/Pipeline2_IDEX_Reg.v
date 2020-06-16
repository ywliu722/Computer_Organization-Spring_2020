/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module Pipeline2_IDEX_Reg(
    input           	 clk_i,
    input           	 rst_i,
    input  		 RegWrite_in,
    input		 MemtoReg_in,
    input		 Branch_in,
    input		 MemRead_in,
    input		 MemWrite_in,
    input		[1:0] ALUop_in, 
    input		 ALUSrc_in,
    input		[31:0] PC_in,
    input		[31:0] ReadData1_in,
    input		[31:0] ReadData2_in,
    input		[31:0] Immediate_in,
    input		 [3:0] ALUControl_in,
    input		 [4:0] RS1_in,
    input		 [4:0] RS2_in,
    input		 [4:0] RD_in,
    output wire 	 RegWrite_out,
    output wire 	 MemtoReg_out,
    output wire 	 Branch_out,
    output wire 	 MemRead_out,
    output wire 	 MemWrite_out,
    output wire 	[1:0] ALUop_out,
    output wire 	 ALUSrc_out,
    output wire 	[31:0] PC_out,
    output wire 	[31:0] ReadData1_out,
    output wire 	[31:0] ReadData2_out,
    output wire 	[31:0] Immediate_out,
    output wire 	 [3:0] ALUControl_out,
    output wire 	 [4:0] RS1_out,
    output wire 	 [4:0] RS2_out,
    output wire 	 [4:0] RD_out
    );
          
reg signed  RegWrite;		reg signed  MemtoReg;		reg signed  Branch;		reg signed  MemRead;
reg signed  MemWrite;		reg signed [1:0] ALUop;		reg signed  ALUSrc;		reg signed [31:0] PC;
reg signed [31:0] ReadData1;	reg signed [31:0] ReadData2;	reg signed [31:0] Immediate;	reg signed [3:0] ALUControl;
reg signed [4:0] RS1;		reg signed [4:0] RS2;		reg signed [4:0] RD;     

assign RegWrite_out = RegWrite;		assign MemtoReg_out = MemtoReg;		assign Branch_out = Branch;		assign MemRead_out = MemRead;
assign MemWrite_out = MemWrite;		assign ALUop_out = ALUop;		assign ALUSrc_out = ALUSrc;		assign PC_out = PC;
assign ReadData1_out = ReadData1;	assign ReadData2_out = ReadData2;	assign Immediate_out = Immediate;	assign ALUControl_out = ALUControl;
assign RS1_out = RS1;			assign RS2_out = RS2;			assign RD_out = RD;

always @(posedge clk_i) begin
    if(~rst_i) begin
		RegWrite <= 0;	MemtoReg <= 0;	Branch <= 0;	MemRead <= 0;
		MemWrite <= 0;	ALUop <= 0;	ALUSrc <= 0;	PC <= 0;
		ReadData1 <= 0;	ReadData2 <= 0;	Immediate <= 0;	ALUControl <= 0;
		RS1 <= 0;	RS2 <= 0;	RD <= 0;   
	end
    else begin
		RegWrite <= RegWrite_in;	MemtoReg <= MemtoReg_in;	Branch <= Branch_in;		MemRead <= MemRead_in;
		MemWrite <= MemWrite_in;	ALUop <= ALUop_in;		ALUSrc <= ALUSrc_in;		PC <= PC_in;
		ReadData1 <= ReadData1_in;	ReadData2 <= ReadData2_in;	Immediate <= Immediate_in;	ALUControl <= ALUControl_in;
		RS1 <= RS1_in;			RS2 <= RS2_in;			RD <= RD_in; 
	end
end

endmodule     
