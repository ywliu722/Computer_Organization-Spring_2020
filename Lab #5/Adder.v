/***************************************************
Student Name: ªL®a»Ê, ¼BÄ£¤å
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module Adder(
    input  [32-1:0] src1_i,
	input  [32-1:0] src2_i,
	output [32-1:0] sum_o
	);
    
/* Write your code HERE */
	wire carry[31:0];
	genvar index;
	assign sum_o[0]=src1_i[0] ^ src2_i[0];
	assign carry[0]=(src1_i[0] & src2_i[0]);
	
	for(index=1;index<32;index=index+1)begin
		assign sum_o[index]=src1_i[index] ^ src2_i[index] ^ carry[index-1];
		assign carry[index]=(src1_i[index] & src2_i[index]) | (src1_i[index] & carry[index-1]) | (src2_i[index] & carry[index-1]);
	end
endmodule