/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module Pipeline1_IFID_Reg(
    input           	 clk_i,
    input           	 rst_i,
    input  		[31:0] instruction_in,
    input		[31:0] PC_in,
    output wire 	[31:0] instruction_out,
    output wire		[31:0] PC_out
    );
          
reg signed [31:0] instruction; 
reg signed [31:0] PC;
assign instruction_out = instruction;
assign PC_out = PC;

always @(posedge clk_i) begin
    if(~rst_i) begin
	    instruction <= 0;
	    PC <= 0;
	end
    else begin
            instruction <= instruction_in;
	    PC <= PC_in;
	end
end
endmodule     
