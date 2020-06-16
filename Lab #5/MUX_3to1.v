/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module MUX_3to1(
	input  [31:0] data0_i,       
	input  [31:0] data1_i,
	input  [31:0] data2_i,
	input  [ 1:0] select_i,
	output reg[31:0] data_o
    );		   

/* Write your code HERE */
	genvar index;
	for(index=0;index<32;index=index+1)begin
		always @(*)begin
			case(select_i)
				2'b00: data_o[index]=data0_i[index];
				2'b01: data_o[index]=data1_i[index];
				2'b10: data_o[index]=data2_i[index];
				2'b11: data_o[index]=0;
			endcase
		end
	end	

endmodule      
          