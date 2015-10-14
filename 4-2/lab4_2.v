`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:06 08/21/2015 
// Design Name: 
// Module Name:    lab4_2 
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
module lab4_2(
	input clk,rst_n,
	output [14:0]display,
	output [3:0]ftsd_ctl
    );
	 
wire clk_out;
wire [1:0]clk_ctl;
wire rst_n;
wire [3:0]bcd;
wire [3:0]q0;
wire [3:0]q1;
wire [3:0]q2;
wire [3:0]q3;
	 
freq_div a1(
.clk_out(clk_out), // divided clock output
.clk_ctl(clk_ctl), // divided clock output for scan freq
.clk(clk), // global clock input
.rst_n(rst_n) // active low reset
);

bcd2ftsegdec b1(
.display(display), // 14-segment display output
.bcd(bcd) // BCD input
);

scan_ctl c1(
.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
.ftsd_in(bcd), // output to ftsd display
.in0(q0), // 1st input
.in1(q1), // 2nd input
.in2(q2), // 3rd input
.in3(q3), // 4th input
.ftsd_ctl_en(clk_ctl) // divided clock for scan control
);

shifter d1(
.q0(q0), // shifter output
.q1(q1),
.q2(q2),
.q3(q3),
.q4(q4),
.q5(q5),
.clk(clk_out), // global clock
.rst_n(rst_n) // active low reset
);

endmodule
