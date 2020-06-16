/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module Decoder(
	input  [32-1:0] instr_i,
	output 		reg	ALUSrc,
	output 		reg	RegWrite,
	output 		reg	Branch,
	output reg[2-1:0]	ALUOp
	);
	
/* Write your code HERE */
always@(*)begin
	case(instr_i[6:0])
	//R-type
	7'b0110011: begin
		ALUSrc=0;
		RegWrite=1;
		Branch=0;
		ALUOp=2'b10;
	end
	//I-type
	7'b0010011:begin
		ALUSrc=1;
		RegWrite=1;
		Branch=0;
		ALUOp=2'b11;
	end
	//B-type
	7'b1100011:begin
		ALUSrc=0;
		RegWrite=0;
		Branch=1;
		ALUOp=2'b01;
	end
	default:begin
		ALUSrc=0;
		RegWrite=0;
		Branch=0;
		ALUOp=2'b10;	
	end
	endcase
end

endmodule





                    
                    