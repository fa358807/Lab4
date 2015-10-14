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
`define BIT_WIDTH 4
module shifter(
	sh_out, // shifter output
	clk, // global clock
	rst_n, // active low reset
	in,
	mode,
	right
);
	output [`BIT_WIDTH-1:0] sh_out; // output
	input clk; // global clock
	input rst_n; // active low reset
	input in,mode;
	input right;
	reg [`BIT_WIDTH-1:0] sh_out; // output
	reg [`BIT_WIDTH-1:0] q; // output
	reg [`BIT_WIDTH-1:0] Q; // output
	reg d;
	

//Combinational logic
always @(mode)
	begin
	if(right==1'd1)
	begin
	//d=1'd0;
	sh_out=q;
		if(mode==1'd0)
			//d=1'd0;
			d=q[0];
		else
			d=in;
	end
	//if(right==1'd0)
	else
	begin
	//d=1'd0;
	sh_out=Q;
		if(mode==1'd0)
			//d=1'd0;
			d=Q[3];
		else
			d=in;
	end
	end

		
		

// Sequential logics: Flip flops
always @(posedge clk or negedge rst_n)
	if (~rst_n)
		begin
			Q<=`BIT_WIDTH'b1010;
			q<=`BIT_WIDTH'b1010;
			//d<=1'd0;
		end
	else
		begin
		if(right==1'd1)
			q<=`BIT_WIDTH'b1010;
			q[0]<=q[1];
			q[1]<=q[2];
			q[2]<=q[3];
			q[3]<=d;
		if(right==1'd0)
			Q<=`BIT_WIDTH'b1010;
			Q[3]<=Q[2];
			Q[2]<=Q[1];
			Q[1]<=Q[0];
			Q[0]<=d;
		end

endmodule		
