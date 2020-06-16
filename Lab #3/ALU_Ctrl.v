/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module ALU_Ctrl(
	input	[4-1:0]	instr,
	input	[2-1:0]	ALUOp,
	output	reg[4-1:0] ALU_Ctrl_o
	);
	
/* Write your code HERE */

always@(*) begin
	case(ALUOp)
	//R-type
	2'b10:begin
		case(instr[3:0])
		4'b0000: ALU_Ctrl_o=4'b0010;//add
		4'b1000: ALU_Ctrl_o=4'b0110;//sub
		4'b0111: ALU_Ctrl_o=4'b0000;//bitwise and
		4'b0110: ALU_Ctrl_o=4'b0001;//bitwise or
		4'b0100: ALU_Ctrl_o=4'b1110;//exclusive or //exclusive nor == 4'b1111
		4'b0010: ALU_Ctrl_o=4'b0111;//slt && slt imm
		4'b0001: ALU_Ctrl_o=4'b0100;//shift left logical
		4'b1001: ALU_Ctrl_o=4'b1000;//shift left arithmetic
		4'b0101: ALU_Ctrl_o=4'b0101;//shift right logical
		4'b1101: ALU_Ctrl_o=4'b1001;//shift right arithmetic
		default: ALU_Ctrl_o=4'b0010;
		endcase
	end
	//I-type
	2'b11:begin
		case(instr[2:0])
		3'b000: ALU_Ctrl_o=4'b0010;//add
		3'b111: ALU_Ctrl_o=4'b0000;//bitwise and
		3'b110: ALU_Ctrl_o=4'b0001;//bitwise or
		3'b100: ALU_Ctrl_o=4'b1110;//exclusive or //exclusive nor == 4'b1111
		3'b010: ALU_Ctrl_o=4'b0111;//slt && slt imm
		3'b001: ALU_Ctrl_o=4'b0100;//shift left logical
		3'b101: ALU_Ctrl_o=4'b0101;//shift right logical
		default: ALU_Ctrl_o=4'b0010;
		endcase
	end
	//B-type	
	2'b01:begin
		case(instr[2:0])
		3'b000:	 ALU_Ctrl_o=4'b0110;//beq
		3'b001:	 ALU_Ctrl_o=4'b0110;//bne
		default: ALU_Ctrl_o=4'b0110;
		endcase
	end	
		
	default: ALU_Ctrl_o=4'b0010;
	endcase
	
end


endmodule