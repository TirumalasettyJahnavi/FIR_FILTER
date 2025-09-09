`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 18:30:20
// Design Name: 
// Module Name: rca_16bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rca_16bit(
    input  signed [15:0] a,
    input  signed [15:0] b,
    input  c,
    output signed [15:0] sum,
    output carry
);
    wire x;

    rca_8bit b1(a[7:0], b[7:0], c,     sum[7:0],  x);
    rca_8bit b2(a[15:8], b[15:8], x,   sum[15:8], carry);

endmodule
