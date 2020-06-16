/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module Pipeline3_EXMEM_Reg(
    input           	 clk_i,
    input           	 rst_i,
    input  		 RegWrite_in,
    input		 MemtoReg_in,
    input		 Branch_in,
    input		 MemRead_in,
    input		 MemWrite_in,
    input		[31:0] PCimm_in,
    input		 zero_in,
    input		[31:0] ALUresult_in,
    input		[31:0] ReadData2_in,
    input		[4:0] RD_in,
    input		[2:0] Btype_in,
    output wire 	 RegWrite_out,
    output wire 	 MemtoReg_out,
    output wire 	 Branch_out,
    output wire 	 MemRead_out,
    output wire 	 MemWrite_out,
    output wire 	[31:0] PCimm_out,
    output wire 	 zero_out,
    output wire 	[31:0] ALUresult_out,
    output wire 	[31:0] ReadData2_out,
    output wire 	[4:0] RD_out,
    output wire		[2:0] Btype_out
    );
          
reg signed  RegWrite;		reg signed  MemtoReg;		reg signed  Branch;	reg signed  MemRead;
reg signed  MemWrite;		reg signed [31:0] PCimm;	reg signed  zero;	reg signed [31:0] ALUresult;
reg signed [31:0] ReadData2;		reg signed [4:0] RD;     	reg signed  [2:0] Btype;

assign RegWrite_out = RegWrite;		assign MemtoReg_out = MemtoReg;		assign Branch_out = Branch;	assign MemRead_out = MemRead;
assign MemWrite_out = MemWrite;		assign PCimm_out = PCimm;		assign zero_out = zero;		assign ALUresult_out = ALUresult;
assign ReadData2_out = ReadData2;			assign RD_out = RD;  			assign Btype_out = Btype;

always @(posedge clk_i) begin
    if(~rst_i) begin
		RegWrite <= 0;	MemtoReg <= 0;	Branch <= 0;	MemRead <= 0;
		MemWrite <= 0;	PCimm <= 0;	zero <= 0;	ALUresult <= 0;
		ReadData2 <= 0;	RD <= 0;   	Btype <= 0;
	end
    else begin
		RegWrite <= RegWrite_in;	MemtoReg <= MemtoReg_in;	Branch <= Branch_in;	MemRead <= MemRead_in;
		MemWrite <= MemWrite_in;	PCimm <= PCimm_in;		zero <= zero_in;	ALUresult <= ALUresult_in;
		ReadData2 <= ReadData2_in;	RD <= RD_in; 			Btype <= Btype_in;
	end
end

endmodule     
