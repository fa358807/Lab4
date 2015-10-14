`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:55 08/21/2015 
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
`define BIT_WIDTH 8
module shifter(
	q, // shifter output
	clk, // global clock
	rst_n, // active low reset
	in,mode
);
	output [`BIT_WIDTH-1:0] q; // output
	input clk; // global clock
	input rst_n; // active low reset
	input in,mode;
	reg [`BIT_WIDTH-1:0] q; // output
	reg d;

//Combinational logic
always @(mode)
	begin
		if(mode==1'd0)
			d=q[0];
		else
			d=in;
	end

// Sequential logics: Flip flops
always @(posedge clk or negedge rst_n)
	if (~rst_n)
		begin
			q<=`BIT_WIDTH'b01010101;
		end
	else
		begin
			q[0]<=q[1];
			q[1]<=q[2];
			q[2]<=q[3];
			q[3]<=q[4];
			q[4]<=q[5];
			q[5]<=q[6];
			q[6]<=q[7];
			q[7]<=d;			
		end

endmodule		
