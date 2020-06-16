/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module Decoder(
	input  [32-1:0] instr_i,
	output     reg     ALUSrc,
	output     reg     MemtoReg,
	output     reg     RegWrite,
	output     reg    MemRead,
	output     reg     MemWrite,
	output    reg      Branch,
	output reg[1:0]	ALUOp
	);
	
/* Write your code HERE */
always@(*)begin
	case(instr_i[6:0])
	//R-type
	7'b0110011: begin
		ALUSrc=0;
		MemtoReg=0;
		RegWrite=1;
		MemRead=0;
		MemWrite=0;
		Branch=0;
		ALUOp=2'b10;
	end
	//I-type
	7'b0010011:begin
		ALUSrc=1;
		MemtoReg=0;
		RegWrite=1;
		MemRead=0;
		MemWrite=0;
		Branch=0;
		ALUOp=2'b11;
	end
	7'b0000011:begin //lw
		ALUSrc=1;
		MemtoReg=1;
		RegWrite=1;
		MemRead=1;
		MemWrite=0;
		Branch=0;
		ALUOp=2'b00;	
	end
	//S-type
	7'b0100011:begin //sw
		ALUSrc=1;
		MemtoReg=0;
		RegWrite=0;
		MemRead=0;
		MemWrite=1;
		Branch=0;
		ALUOp=2'b00;
	end
	//B-type
	7'b1100011:begin
		ALUSrc=0;
		MemtoReg=0;
		RegWrite=0;
		MemRead=0;
		MemWrite=0;
		Branch=1;
		ALUOp=2'b01;
	end
	//JU-type
	7'b1101111:begin //jal
		ALUSrc=0;
		MemtoReg=0;
		RegWrite=1;
		MemRead=0;
		MemWrite=0;
		Branch=0;
		ALUOp=2'b10;
	end
	7'b1100111:begin //jalr
		ALUSrc=0;
		MemtoReg=0;
		RegWrite=0;
		MemRead=0;
		MemWrite=0;
		Branch=0;
		ALUOp=2'b10;
	end
	default:begin
		ALUSrc=0;
		MemtoReg=0;
		RegWrite=0;
		MemRead=0;
		MemWrite=0;
		Branch=0;
		ALUOp=2'b10;
	end
	endcase
end

endmodule





                    
                    