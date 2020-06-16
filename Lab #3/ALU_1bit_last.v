/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/
`timescale 1ns/1ps

module ALU_1bit_last(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				Cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout,        //1 bit carry out (output)
	output reg	    last,
	input				slt
	);

/* Write your code HERE */
	reg a1,b1;
	wire andout,orout,addout,tp;
always@(*)begin
	if(Ainvert == 1'b0)begin
	a1 = src1;
	end
	else begin
	a1= ~src1;
	end

	if(Binvert== 1'b0)begin
	b1=src2;
	end
	else begin
	b1= ~src2;
	end
end
	assign andout =a1 & b1;
	assign orout = a1 | b1;
	assign tp = a1 ^ b1;
	assign addout = tp ^ Cin;
	
always@(*)begin
	cout = (a1 & b1) | (tp & Cin);
	case(operation)
		2'b00: result = andout;
		2'b01: result = orout;
		2'b10: result = addout;
		2'b11: result = slt;
	endcase
end
	
always@(*)last=addout;





endmodule