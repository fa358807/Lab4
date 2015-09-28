`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:20:50 08/24/2015 
// Design Name: 
// Module Name:    lab4_3 
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
module lab4_3(
	clk,
	rst_n,
	ftsd_ctl,
	display,
	in,
	mode,
	right,
	sh_out
    );
	 
	input clk;
	input rst_n;
	input in;
	input mode;
	input right;
	
	output [3:0]ftsd_ctl;
	output [14:0]display;
	output [3:0]sh_out;
	
	wire clk_out;
	wire [1:0]clk_ctl;
	wire [3:0]bcd;
	//wire [4:0]sh_out;

freq_div f1(
.clk_out(clk_out), // divided clock output
.clk_ctl(clk_ctl), // divided clock output for scan freq
.clk(clk), // global clock input
.rst_n(rst_n) // active low reset
	); 

scan_ctl s1(
.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
.ftsd_in(bcd), // output to ftsd display
.in0(sh_out[3]), // 1st input
.in1(sh_out[2]), // 2nd input
.in2(sh_out[1]), // 3rd input
.in3(sh_out[0]), // 4th input
.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);
	
bcd2ftsegdec b1(
.display(display), // 14-segment display output
.bcd(bcd) // BCD input
	);

shifter sh1(
.sh_out(sh_out), // shifter output
.clk(clk_out), // global clock
.rst_n(rst_n), // active low reset
.in(in),
.mode(mode),
.right(right)
);


endmodule
