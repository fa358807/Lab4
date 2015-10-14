`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:54 08/21/2015 
// Design Name: 
// Module Name:    shifter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define BIT_WIDTH 4
module shifter(
	q0,q1,q2,q3,q4,q5, // shifter output
	clk, // global clock
	rst_n // active low reset
);
	output reg[`BIT_WIDTH-1:0] q0;
	output reg[`BIT_WIDTH-1:0] q1;
	output reg[`BIT_WIDTH-1:0] q2;
	output reg[`BIT_WIDTH-1:0] q3;
	output reg[`BIT_WIDTH-1:0] q4;
	output reg[`BIT_WIDTH-1:0] q5; // output
	input clk; // global clock
	input rst_n; // active low reset
	

// Sequential logics: Flip flops
always @(posedge clk or negedge rst_n)
	if (~rst_n)
		begin
			q0<=`BIT_WIDTH'b0000;
			q1<=`BIT_WIDTH'b0001;
			q2<=`BIT_WIDTH'b0010;
			q3<=`BIT_WIDTH'b0011;
			q4<=`BIT_WIDTH'b0100;
			q5<=`BIT_WIDTH'b0101;
		end
	else
		begin
			q0<=q1;
			q1<=q2;
			q2<=q3;
			q3<=q4;
			q4<=q5;
			q5<=q0;				
		end

endmodule		
