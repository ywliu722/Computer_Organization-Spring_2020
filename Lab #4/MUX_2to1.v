/***************************************************
Student Name: ªL®a»Ê, ¼BÄ£¤å
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module MUX_2to1(
	input  [32-1:0] data0_i,       
	input  [32-1:0] data1_i,
	input       	select_i,
	output reg[32-1:0] data_o
               );
			   
/* Write your code HERE */
	genvar index;
	for(index=0;index<32;index=index+1)begin
		always @(*)begin
			case(select_i)
				1'b0: data_o[index]=data0_i[index];
				1'b1: data_o[index]=data1_i[index];
			endcase
		end
	end		   
endmodule
