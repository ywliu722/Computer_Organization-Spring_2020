/***************************************************
Student Name: 林家銘, 劉耀文
Student ID: 0716229, 0716236
***************************************************/

`timescale 1ns/1ps

module Forwarding_Unit(
	input  		[4:0] EX_RS1,
	input  		[4:0] EX_RS2,
	input  		[4:0] MEM_RD,
	input  		[4:0] WB_RD,
	input		 ALUSrc,
	input		 MEM_RegWrite,
	input		 WB_RegWrite,
	output reg 	[1:0] MUX1_select,
	output reg 	[1:0] MUX2_select
	);

always@(*)begin
	if(MEM_RegWrite && (MEM_RD != 0) && (MEM_RD == EX_RS1)) begin
		MUX1_select = 2'b01;
	end
	else if(WB_RegWrite && (MEM_RD != 0) && (MEM_RD != EX_RS1) && (WB_RD == EX_RS1)) begin
		MUX1_select = 2'b10;
	end
	else begin
		MUX1_select = 2'b00;
	end
	
	if(MEM_RegWrite && (MEM_RD != 0) && (MEM_RD == EX_RS2)) begin
		MUX2_select = 2'b01;
	end
	else if(WB_RegWrite && (MEM_RD != 0) && (MEM_RD != EX_RS2) && (WB_RD == EX_RS2)) begin
		MUX2_select = 2'b10;
	end
	else if(ALUSrc) begin
		MUX2_select = 2'b11;	
	end
	else begin
		MUX2_select = 2'b00;
	end
end

endmodule