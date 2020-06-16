/***************************************************
Student Name: ¼BÄ£¤å
Student ID: 0716236
***************************************************/
`timescale 1ns/1ps

module ALU_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input				less,	    //1 bit less      (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				Cin,        //1 bit carry in  (input)
	input 	    		[2-1:0] operation,  //2 bit operation (input)
	output reg  		        result,     //1 bit result    (output)
	output reg  		        cout,       //1 bit carry out (output)
	output reg			add	    //1 bit sum	      (output)
	);

/* Write your code HERE */
	wire	NOT_A, NOT_B;
	reg	MUXOUT_A, MUXOUT_B;
	wire	AND_OUT, OR_OUT, SUM;
	wire	w1, w2, w3, carry_out;
	
	/*NOT GATE*/
	not	not1(NOT_A, src1);
	not	not2(NOT_B, src2);

	/*MUX_A*/
	always @(src1, Ainvert, NOT_A) begin
		case(Ainvert)
			1'b0:
				MUXOUT_A <= src1;
			1'b1:
				MUXOUT_A <= NOT_A;
			default:
				MUXOUT_A <= 1'b0;
		endcase
	end
	
	/*MUX_B*/
	always @(src2, Binvert, NOT_B) begin
		case(Binvert)
			1'b0:
				MUXOUT_B <= src2;
			1'b1:
				MUXOUT_B <= NOT_B;
			default:
				MUXOUT_B <= 1'b0;
		endcase
	end
	
	/*AND GATE*/
	and	and1(AND_OUT, MUXOUT_A, MUXOUT_B);
	/*OR GATE*/
	or	or1(OR_OUT, MUXOUT_A, MUXOUT_B);
	
	/*1 bit adder - sum*/
	xor	add_xor1(SUM, MUXOUT_A, MUXOUT_B, Cin);
	/*1 bit adder - carry out*/
	and	add_and1(w1, MUXOUT_A, MUXOUT_B);
	and	add_and2(w2, MUXOUT_A, Cin);
	and	add_and3(w3, MUXOUT_B, Cin);
	or	add_or1(carry_out, w1, w2, w3);
	
	/*Assign SUM to add (this output is for ALU31 set signal)*/
	always @(SUM, carry_out) begin
		add <= SUM;
		cout <= carry_out;
	end

	/*MUX_Result*/
	always @(AND_OUT, OR_OUT, SUM, operation, less) begin
		case(operation)
			2'b00:
				result <= AND_OUT;
			2'b01:
				result <= OR_OUT;
			2'b10:
				result <= SUM;
			2'b11:
				result <= less;
			default:
				result <= result;
		endcase
	end
endmodule
