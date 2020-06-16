/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module Pipeline4_MEMWB_Reg(
    input           	 clk_i,
    input           	 rst_i,
    input  		 RegWrite_in,
    input		 MemtoReg_in,
    input		[31:0] MemData_in,
    input		[31:0] ALUresult_in,
    input		[4:0] RD_in,
    output wire 	 RegWrite_out,
    output wire 	 MemtoReg_out,
    output wire 	[31:0] MemData_out,
    output wire 	[31:0] ALUresult_out,
    output wire 	[4:0] RD_out
    );
          
reg signed  RegWrite;		reg signed  MemtoReg;		reg signed  [31:0] MemData;
reg signed [31:0] ALUresult;	reg signed [4:0] RD;     

assign RegWrite_out = RegWrite;		assign MemtoReg_out = MemtoReg;		assign MemData_out = MemData;
assign ALUresult_out = ALUresult;	assign RD_out = RD;  

always @(posedge clk_i) begin
    if(~rst_i) begin
		RegWrite <= 0;	MemtoReg <= 0;	MemData <= 0;
		ALUresult <= 0;	RD <= 0;   
	end
    else begin
		RegWrite <= RegWrite_in;	MemtoReg <= MemtoReg_in;	MemData <= MemData_in;
		ALUresult <= ALUresult_in;	RD <= RD_in; 
	end
end

endmodule     
