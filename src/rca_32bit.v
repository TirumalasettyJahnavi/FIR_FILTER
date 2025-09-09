`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 18:36:54
// Design Name: 
// Module Name: rca_32bit
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

module rca_32bit(
  input signed [31:0] a, b,
  input c,
  output signed [31:0] sum,
  output carry
);

    wire x;

    rca_16bit b1(a[15:0],  b[15:0],  c, sum[15:0],  x);
    rca_16bit b2(a[31:16], b[31:16], x, sum[31:16], carry);

endmodule
