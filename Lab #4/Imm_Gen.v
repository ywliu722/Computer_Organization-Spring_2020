/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module Imm_Gen(
	input  [31:0] instr_i,
	output reg[31:0] Imm_Gen_o
	);

/* Write your code HERE */
always@(*)begin
	case(instr_i[6:0])
		//I-type
		7'b0010011: begin
			Imm_Gen_o[0] = instr_i[20];
			Imm_Gen_o[1] = instr_i[21];
			Imm_Gen_o[2] = instr_i[22];
			Imm_Gen_o[3] = instr_i[23];
			Imm_Gen_o[4] = instr_i[24];
			Imm_Gen_o[5] = instr_i[25];
			Imm_Gen_o[6] = instr_i[26];
			Imm_Gen_o[7] = instr_i[27];
			Imm_Gen_o[8] = instr_i[28];
			Imm_Gen_o[9] = instr_i[29];
			Imm_Gen_o[10] = instr_i[30];
			Imm_Gen_o[11] = instr_i[31];
			//sign extension
			Imm_Gen_o[12] = instr_i[31];
			Imm_Gen_o[13] = instr_i[31];
			Imm_Gen_o[14] = instr_i[31];
			Imm_Gen_o[15] = instr_i[31];
			Imm_Gen_o[16] = instr_i[31];
			Imm_Gen_o[17] = instr_i[31];
			Imm_Gen_o[18] = instr_i[31];
			Imm_Gen_o[19] = instr_i[31];
			Imm_Gen_o[20] = instr_i[31];
			Imm_Gen_o[21] = instr_i[31];
			Imm_Gen_o[22] = instr_i[31];
			Imm_Gen_o[23] = instr_i[31];
			Imm_Gen_o[24] = instr_i[31];
			Imm_Gen_o[25] = instr_i[31];
			Imm_Gen_o[26] = instr_i[31];
			Imm_Gen_o[27] = instr_i[31];
			Imm_Gen_o[28] = instr_i[31];
			Imm_Gen_o[29] = instr_i[31];
			Imm_Gen_o[30] = instr_i[31];
			Imm_Gen_o[31] = instr_i[31];
			end
		//B-type
		7'b1100011: begin
			Imm_Gen_o[0] = instr_i[8];
			Imm_Gen_o[1] = instr_i[9];
			Imm_Gen_o[2] = instr_i[10];
			Imm_Gen_o[3] = instr_i[11];
			Imm_Gen_o[4] = instr_i[25];
			Imm_Gen_o[5] = instr_i[26];
			Imm_Gen_o[6] = instr_i[27];
			Imm_Gen_o[7] = instr_i[28];
			Imm_Gen_o[8] = instr_i[29];
			Imm_Gen_o[9] = instr_i[30];
			Imm_Gen_o[10] = instr_i[7];
			Imm_Gen_o[11] = instr_i[31];
			//sign extension
			Imm_Gen_o[12] = instr_i[31];
			Imm_Gen_o[13] = instr_i[31];
			Imm_Gen_o[14] = instr_i[31];
			Imm_Gen_o[15] = instr_i[31];
			Imm_Gen_o[16] = instr_i[31];
			Imm_Gen_o[17] = instr_i[31];
			Imm_Gen_o[18] = instr_i[31];
			Imm_Gen_o[19] = instr_i[31];
			Imm_Gen_o[20] = instr_i[31];
			Imm_Gen_o[21] = instr_i[31];
			Imm_Gen_o[22] = instr_i[31];
			Imm_Gen_o[23] = instr_i[31];
			Imm_Gen_o[24] = instr_i[31];
			Imm_Gen_o[25] = instr_i[31];
			Imm_Gen_o[26] = instr_i[31];
			Imm_Gen_o[27] = instr_i[31];
			Imm_Gen_o[28] = instr_i[31];
			Imm_Gen_o[29] = instr_i[31];
			Imm_Gen_o[30] = instr_i[31];
			Imm_Gen_o[31] = instr_i[31];
			end
		//lw
		7'b0000011: begin
			Imm_Gen_o[0] = instr_i[20];
			Imm_Gen_o[1] = instr_i[21];
			Imm_Gen_o[2] = instr_i[22];
			Imm_Gen_o[3] = instr_i[23];
			Imm_Gen_o[4] = instr_i[24];
			Imm_Gen_o[5] = instr_i[25];
			Imm_Gen_o[6] = instr_i[26];
			Imm_Gen_o[7] = instr_i[27];
			Imm_Gen_o[8] = instr_i[28];
			Imm_Gen_o[9] = instr_i[29];
			Imm_Gen_o[10] = instr_i[30];
			Imm_Gen_o[11] = instr_i[31];
			//sign extension
			Imm_Gen_o[12] = instr_i[31];
			Imm_Gen_o[13] = instr_i[31];
			Imm_Gen_o[14] = instr_i[31];
			Imm_Gen_o[15] = instr_i[31];
			Imm_Gen_o[16] = instr_i[31];
			Imm_Gen_o[17] = instr_i[31];
			Imm_Gen_o[18] = instr_i[31];
			Imm_Gen_o[19] = instr_i[31];
			Imm_Gen_o[20] = instr_i[31];
			Imm_Gen_o[21] = instr_i[31];
			Imm_Gen_o[22] = instr_i[31];
			Imm_Gen_o[23] = instr_i[31];
			Imm_Gen_o[24] = instr_i[31];
			Imm_Gen_o[25] = instr_i[31];
			Imm_Gen_o[26] = instr_i[31];
			Imm_Gen_o[27] = instr_i[31];
			Imm_Gen_o[28] = instr_i[31];
			Imm_Gen_o[29] = instr_i[31];
			Imm_Gen_o[30] = instr_i[31];
			Imm_Gen_o[31] = instr_i[31];
			end
		//S-type
		7'b0100011: begin
			Imm_Gen_o[0] = instr_i[7];
			Imm_Gen_o[1] = instr_i[8];
			Imm_Gen_o[2] = instr_i[9];
			Imm_Gen_o[3] = instr_i[10];
			Imm_Gen_o[4] = instr_i[11];
			Imm_Gen_o[5] = instr_i[25];
			Imm_Gen_o[6] = instr_i[26];
			Imm_Gen_o[7] = instr_i[27];
			Imm_Gen_o[8] = instr_i[28];
			Imm_Gen_o[9] = instr_i[29];
			Imm_Gen_o[10] = instr_i[30];
			Imm_Gen_o[11] = instr_i[31];
			//sign extension
			Imm_Gen_o[12] = instr_i[31];
			Imm_Gen_o[13] = instr_i[31];
			Imm_Gen_o[14] = instr_i[31];
			Imm_Gen_o[15] = instr_i[31];
			Imm_Gen_o[16] = instr_i[31];
			Imm_Gen_o[17] = instr_i[31];
			Imm_Gen_o[18] = instr_i[31];
			Imm_Gen_o[19] = instr_i[31];
			Imm_Gen_o[20] = instr_i[31];
			Imm_Gen_o[21] = instr_i[31];
			Imm_Gen_o[22] = instr_i[31];
			Imm_Gen_o[23] = instr_i[31];
			Imm_Gen_o[24] = instr_i[31];
			Imm_Gen_o[25] = instr_i[31];
			Imm_Gen_o[26] = instr_i[31];
			Imm_Gen_o[27] = instr_i[31];
			Imm_Gen_o[28] = instr_i[31];
			Imm_Gen_o[29] = instr_i[31];
			Imm_Gen_o[30] = instr_i[31];
			Imm_Gen_o[31] = instr_i[31];
			end
		//JU-type
		7'b1101111: begin
			Imm_Gen_o[0] = instr_i[21];
			Imm_Gen_o[1] = instr_i[22];
			Imm_Gen_o[2] = instr_i[23];
			Imm_Gen_o[3] = instr_i[24];
			Imm_Gen_o[4] = instr_i[25];
			Imm_Gen_o[5] = instr_i[26];
			Imm_Gen_o[6] = instr_i[27];
			Imm_Gen_o[7] = instr_i[28];
			Imm_Gen_o[8] = instr_i[29];
			Imm_Gen_o[9] = instr_i[30];
			Imm_Gen_o[10] = instr_i[20];
			Imm_Gen_o[11] = instr_i[12];
			Imm_Gen_o[12] = instr_i[13];
			Imm_Gen_o[13] = instr_i[14];
			Imm_Gen_o[14] = instr_i[15];
			Imm_Gen_o[15] = instr_i[16];
			Imm_Gen_o[16] = instr_i[17];
			Imm_Gen_o[17] = instr_i[18];
			Imm_Gen_o[18] = instr_i[19];
			Imm_Gen_o[19] = instr_i[31];
			//sign extension
			Imm_Gen_o[20] = instr_i[31];
			Imm_Gen_o[21] = instr_i[31];
			Imm_Gen_o[22] = instr_i[31];
			Imm_Gen_o[23] = instr_i[31];
			Imm_Gen_o[24] = instr_i[31];
			Imm_Gen_o[25] = instr_i[31];
			Imm_Gen_o[26] = instr_i[31];
			Imm_Gen_o[27] = instr_i[31];
			Imm_Gen_o[28] = instr_i[31];
			Imm_Gen_o[29] = instr_i[31];
			Imm_Gen_o[30] = instr_i[31];
			Imm_Gen_o[31] = instr_i[31];
			end
		//jalr
		7'b1100111: begin
			Imm_Gen_o[0] = instr_i[20];
			Imm_Gen_o[1] = instr_i[21];
			Imm_Gen_o[2] = instr_i[22];
			Imm_Gen_o[3] = instr_i[23];
			Imm_Gen_o[4] = instr_i[24];
			Imm_Gen_o[5] = instr_i[25];
			Imm_Gen_o[6] = instr_i[26];
			Imm_Gen_o[7] = instr_i[27];
			Imm_Gen_o[8] = instr_i[28];
			Imm_Gen_o[9] = instr_i[29];
			Imm_Gen_o[10] = instr_i[30];
			Imm_Gen_o[11] = instr_i[31];
			//sign extension
			Imm_Gen_o[12] = instr_i[31];
			Imm_Gen_o[13] = instr_i[31];
			Imm_Gen_o[14] = instr_i[31];
			Imm_Gen_o[15] = instr_i[31];
			Imm_Gen_o[16] = instr_i[31];
			Imm_Gen_o[17] = instr_i[31];
			Imm_Gen_o[18] = instr_i[31];
			Imm_Gen_o[19] = instr_i[31];
			Imm_Gen_o[20] = instr_i[31];
			Imm_Gen_o[21] = instr_i[31];
			Imm_Gen_o[22] = instr_i[31];
			Imm_Gen_o[23] = instr_i[31];
			Imm_Gen_o[24] = instr_i[31];
			Imm_Gen_o[25] = instr_i[31];
			Imm_Gen_o[26] = instr_i[31];
			Imm_Gen_o[27] = instr_i[31];
			Imm_Gen_o[28] = instr_i[31];
			Imm_Gen_o[29] = instr_i[31];
			Imm_Gen_o[30] = instr_i[31];
			Imm_Gen_o[31] = instr_i[31];
			end
		//R-type
		default: begin
			Imm_Gen_o[0] = 0;
			Imm_Gen_o[1] = 0;
			Imm_Gen_o[2] = 0;
			Imm_Gen_o[3] = 0;
			Imm_Gen_o[4] = 0;
			Imm_Gen_o[5] = 0;
			Imm_Gen_o[6] = 0;
			Imm_Gen_o[7] = 0;
			Imm_Gen_o[8] = 0;
			Imm_Gen_o[9] = 0;
			Imm_Gen_o[10] = 0;
			Imm_Gen_o[11] = 0;
			Imm_Gen_o[12] = 0;
			Imm_Gen_o[13] = 0;
			Imm_Gen_o[14] = 0;
			Imm_Gen_o[15] = 0;
			Imm_Gen_o[16] = 0;
			Imm_Gen_o[17] = 0;
			Imm_Gen_o[18] = 0;
			Imm_Gen_o[19] = 0;
			Imm_Gen_o[20] = 0;
			Imm_Gen_o[21] = 0;
			Imm_Gen_o[22] = 0;
			Imm_Gen_o[23] = 0;
			Imm_Gen_o[24] = 0;
			Imm_Gen_o[25] = 0;
			Imm_Gen_o[26] = 0;
			Imm_Gen_o[27] = 0;
			Imm_Gen_o[28] = 0;
			Imm_Gen_o[29] = 0;
			Imm_Gen_o[30] = 0;
			Imm_Gen_o[31] = 0;
			end
	endcase
end

endmodule