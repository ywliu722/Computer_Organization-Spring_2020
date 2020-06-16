/***************************************************
Student Name: ¼BÄ£¤å
Student ID: 0716236
***************************************************/
`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	       [32-1:0]	src1,          // 32 bits source 1          (input)
	input	       [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	    [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */
wire	[31:0] carry;
wire	[31:0] add;
wire  [31:0] res;
wire	zero_detect, overflow_detect;
/*
ALU_1bit ALU_NUM(src1,src2,less,Ainvert,Binvert,Cin,[1:0]operation,result,cout,add);
*/
ALU_1bit ALU_00(src1[0],src2[0],add[31],ALU_control[3],ALU_control[2],ALU_control[2],ALU_control[1:0],res[0],carry[0],add[0]);
ALU_1bit ALU_01(src1[1],src2[1],1'b0,ALU_control[3],ALU_control[2],carry[0],ALU_control[1:0],res[1],carry[1],add[1]);
ALU_1bit ALU_02(src1[2],src2[2],1'b0,ALU_control[3],ALU_control[2],carry[1],ALU_control[1:0],res[2],carry[2],add[2]);
ALU_1bit ALU_03(src1[3],src2[3],1'b0,ALU_control[3],ALU_control[2],carry[2],ALU_control[1:0],res[3],carry[3],add[3]);
ALU_1bit ALU_04(src1[4],src2[4],1'b0,ALU_control[3],ALU_control[2],carry[3],ALU_control[1:0],res[4],carry[4],add[4]);
ALU_1bit ALU_05(src1[5],src2[5],1'b0,ALU_control[3],ALU_control[2],carry[4],ALU_control[1:0],res[5],carry[5],add[5]);
ALU_1bit ALU_06(src1[6],src2[6],1'b0,ALU_control[3],ALU_control[2],carry[5],ALU_control[1:0],res[6],carry[6],add[6]);
ALU_1bit ALU_07(src1[7],src2[7],1'b0,ALU_control[3],ALU_control[2],carry[6],ALU_control[1:0],res[7],carry[7],add[7]);
ALU_1bit ALU_08(src1[8],src2[8],1'b0,ALU_control[3],ALU_control[2],carry[7],ALU_control[1:0],res[8],carry[8],add[8]);
ALU_1bit ALU_09(src1[9],src2[9],1'b0,ALU_control[3],ALU_control[2],carry[8],ALU_control[1:0],res[9],carry[9],add[9]);

ALU_1bit ALU_10(src1[10],src2[10],1'b0,ALU_control[3],ALU_control[2],carry[9],ALU_control[1:0],res[10],carry[10],add[10]);
ALU_1bit ALU_11(src1[11],src2[11],1'b0,ALU_control[3],ALU_control[2],carry[10],ALU_control[1:0],res[11],carry[11],add[11]);
ALU_1bit ALU_12(src1[12],src2[12],1'b0,ALU_control[3],ALU_control[2],carry[11],ALU_control[1:0],res[12],carry[12],add[12]);
ALU_1bit ALU_13(src1[13],src2[13],1'b0,ALU_control[3],ALU_control[2],carry[12],ALU_control[1:0],res[13],carry[13],add[13]);
ALU_1bit ALU_14(src1[14],src2[14],1'b0,ALU_control[3],ALU_control[2],carry[13],ALU_control[1:0],res[14],carry[14],add[14]);
ALU_1bit ALU_15(src1[15],src2[15],1'b0,ALU_control[3],ALU_control[2],carry[14],ALU_control[1:0],res[15],carry[15],add[15]);
ALU_1bit ALU_16(src1[16],src2[16],1'b0,ALU_control[3],ALU_control[2],carry[15],ALU_control[1:0],res[16],carry[16],add[16]);
ALU_1bit ALU_17(src1[17],src2[17],1'b0,ALU_control[3],ALU_control[2],carry[16],ALU_control[1:0],res[17],carry[17],add[17]);
ALU_1bit ALU_18(src1[18],src2[18],1'b0,ALU_control[3],ALU_control[2],carry[17],ALU_control[1:0],res[18],carry[18],add[18]);
ALU_1bit ALU_19(src1[19],src2[19],1'b0,ALU_control[3],ALU_control[2],carry[18],ALU_control[1:0],res[19],carry[19],add[19]);

ALU_1bit ALU_20(src1[20],src2[20],1'b0,ALU_control[3],ALU_control[2],carry[19],ALU_control[1:0],res[20],carry[20],add[20]);
ALU_1bit ALU_21(src1[21],src2[21],1'b0,ALU_control[3],ALU_control[2],carry[20],ALU_control[1:0],res[21],carry[21],add[21]);
ALU_1bit ALU_22(src1[22],src2[22],1'b0,ALU_control[3],ALU_control[2],carry[21],ALU_control[1:0],res[22],carry[22],add[22]);
ALU_1bit ALU_23(src1[23],src2[23],1'b0,ALU_control[3],ALU_control[2],carry[22],ALU_control[1:0],res[23],carry[23],add[23]);
ALU_1bit ALU_24(src1[24],src2[24],1'b0,ALU_control[3],ALU_control[2],carry[23],ALU_control[1:0],res[24],carry[24],add[24]);
ALU_1bit ALU_25(src1[25],src2[25],1'b0,ALU_control[3],ALU_control[2],carry[24],ALU_control[1:0],res[25],carry[25],add[25]);
ALU_1bit ALU_26(src1[26],src2[26],1'b0,ALU_control[3],ALU_control[2],carry[25],ALU_control[1:0],res[26],carry[26],add[26]);
ALU_1bit ALU_27(src1[27],src2[27],1'b0,ALU_control[3],ALU_control[2],carry[26],ALU_control[1:0],res[27],carry[27],add[27]);
ALU_1bit ALU_28(src1[28],src2[28],1'b0,ALU_control[3],ALU_control[2],carry[27],ALU_control[1:0],res[28],carry[28],add[28]);
ALU_1bit ALU_29(src1[29],src2[29],1'b0,ALU_control[3],ALU_control[2],carry[28],ALU_control[1:0],res[29],carry[29],add[29]);

ALU_1bit ALU_30(src1[30],src2[30],1'b0,ALU_control[3],ALU_control[2],carry[29],ALU_control[1:0],res[30],carry[30],add[30]);
ALU_1bit ALU_31(src1[31],src2[31],1'b0,ALU_control[3],ALU_control[2],carry[30],ALU_control[1:0],res[31],carry[31],add[31]);

/*zero signal*/
nor	nor_zero(zero_detect, res[0], res[1], res[2], res[3], res[4], res[5], res[6], res[7], res[8], res[9],
		       	      res[10], res[11], res[12], res[13], res[14], res[15], res[16], res[17], res[18], res[19],
		       	      res[20], res[21], res[22], res[23], res[24], res[25], res[26], res[27], res[28], res[29],
		       	      res[30], res[31]);
/*overflow signal*/
xor	xor_overflow(overflow_detect, carry[30], carry[31]);

/*save the output signal into register*/
always @(zero_detect, overflow_detect, carry[31], ALU_control[1:0]) begin
	zero <= zero_detect;
	case(ALU_control[1:0])
		2'b00:
			cout <= 1'b0;
		2'b01:
			cout <= 1'b0;
		2'b10:
			cout <= carry[31];
		2'b11:
			cout <= carry[31];
		default:
			cout <= 1'b0;
	endcase
	
	case(ALU_control[1:0])
		2'b00:
			overflow <= 1'b0;
		2'b01:
			overflow <= 1'b0;
		2'b10:
			overflow <= overflow_detect;
		2'b11:
			overflow <= overflow_detect;
		default:
			overflow <= 1'b0;
	endcase
end

always @(res[0], res[1], res[2], res[3], res[4], res[5], res[6], res[7], res[8], res[9], res[10], 
         res[11], res[12], res[13], res[14], res[15], res[16], res[17], res[18], res[19], res[20],
			res[21], res[22], res[23], res[24], res[25], res[26], res[27], res[28], res[29], res[30], res[31])
begin
	result[0] <= res[0];
	result[1] <= res[1];
	result[2] <= res[2];
	result[3] <= res[3];
	result[4] <= res[4];
	result[5] <= res[5];
	result[6] <= res[6];
	result[7] <= res[7];
	result[8] <= res[8];
	result[9] <= res[9];
	
	result[10] <= res[10];
	result[11] <= res[11];
	result[12] <= res[12];
	result[13] <= res[13];
	result[14] <= res[14];
	result[15] <= res[15];
	result[16] <= res[16];
	result[17] <= res[17];
	result[18] <= res[18];
	result[19] <= res[19];
	
	result[20] <= res[20];
	result[21] <= res[21];
	result[22] <= res[22];
	result[23] <= res[23];
	result[24] <= res[24];
	result[25] <= res[25];
	result[26] <= res[26];
	result[27] <= res[27];
	result[28] <= res[28];
	result[29] <= res[29];
	
	result[30] <= res[30];
	result[31] <= res[31];
end

endmodule
