`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:33 08/21/2015 
// Design Name: 
// Module Name:    lab4_1 
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
module lab4_1(
	input clk,
	input rst_n,
	input in,
	input mode,
	output [7:0]q
    );

wire clk_out;
	 
freq_div a1(
.clk_out(clk_out), // divided clock output
.clk(clk), // global clock input
.rst_n(rst_n) // active low reset
);

shifter b1(
.q(q), // shifter output
.clk(clk_out), // global clock
.rst_n(rst_n), // active low reset
.in(in),
.mode(mode)
);


endmodule
