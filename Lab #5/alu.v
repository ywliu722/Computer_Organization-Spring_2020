/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/
`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */
	wire carry_out[32:0];
	wire rem[32:0];
	wire last_add,test;
	reg temp=1'b0,temp2,z=1'b0;
	wire [3:0]isoverflow;
	reg rem_result;

genvar i;
ALU_1bit first(src1[0],src2[0],ALU_control[3],ALU_control[2],carry_out[0],ALU_control[1:0],rem[0],carry_out[1],temp);
ALU_1bit_last last(src1[31],src2[31],ALU_control[3],ALU_control[2],carry_out[31],ALU_control[1:0],rem[31],carry_out[32],last_add,z);
generate
	
	for(i=1;i<31;i=i+1)
	ALU_1bit alus(src1[i],src2[i],ALU_control[3],ALU_control[2],carry_out[i],ALU_control[1:0],rem[i],carry_out[i+1],z);
endgenerate

assign isoverflow[3] = ALU_control[2];
assign isoverflow[2] = src1[31];
assign isoverflow[1] = src2[31];
assign isoverflow[0] = result[31];




always@(*)temp=last_add;
//ALU_1bit alus(.src1(src1[0]),.src2(src2[0]),.Ainvert(ALU_control[3]),.Binvert(ALU_control[2]),.Cin(carry_out[0]),.operation(ALU_control[1:0]),.result(rem[0]),.cout(carry_out[1]));
always@(*)begin
if(ALU_control==4'b0110||ALU_control==4'b0111)
	temp2=1;
else
	temp2=0;
end

assign carry_out[0]=temp2;


for(i=0;i<32;i=i+1)begin
always@(*)begin
	if(rst_n)begin
	if(ALU_control==4'b1110)
		result[i]=src1[i]^src2[i];
	else if(ALU_control==4'b1111)
		result[i]=src1[i]~^src2[i];
	else
	result[i] = rem[i];
end
end
end

always@(*)begin
	if(rst_n)begin
	if(ALU_control==4'b0100)
		result=src1<<src2;
	else if(ALU_control==4'b0101)
		result=src1>>src2;
	else if(ALU_control==4'b1000)
		result=src1<<<src2;
	else if(ALU_control==4'b1001)
		result=src1>>>src2;
	else
		result=result;
end
end




always@(*)begin
	if(rst_n)begin
	zero= ~(result[0]|result[1]|result[2]|result[3]|result[4]|result[5]|result[6]|result[7]|result[8]|result[9]|result[10]|result[11]|result[12]|result[13]|result[14]|result[15]|result[16]|result[17]|result[18]|result[19]|result[20]|result[21]|result[22]|result[23]|result[24]|result[25]|result[26]|result[27]|result[28]|result[29]|result[30]|result[31]);
	end

end



always@(*)begin
	if(rst_n)begin
	if(ALU_control[1:0]==2'b10||ALU_control[1:0]==2'b11)begin
		cout=carry_out[32];
		case(isoverflow)
			4'b0110:overflow=1;
			4'b0001:overflow=1;
			4'b1100:overflow=1;
			4'b1011:overflow=1;
			default:overflow=0;
		endcase
	end
	else begin
		cout=0;
		overflow=0;		
	end
end
end

endmodule
