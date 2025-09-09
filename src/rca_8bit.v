`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 18:17:50
// Design Name: 
// Module Name: rca_8bit
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

module rca_8bit(
    input  signed [7:0] A, B,
    input  Cin,
    output signed [7:0] sum,
    output Cout
);

  wire [6:0] carry;

    fa fa0(A[0], B[0], Cin,     sum[0], carry[0]);
    fa fa1(A[1], B[1], carry[0], sum[1], carry[1]);
    fa fa2(A[2], B[2], carry[1], sum[2], carry[2]);
    fa fa3(A[3], B[3], carry[2], sum[3], carry[3]);
    fa fa4(A[4], B[4], carry[3], sum[4], carry[4]);
    fa fa5(A[5], B[5], carry[4], sum[5], carry[5]);
    fa fa6(A[6], B[6], carry[5], sum[6], carry[6]);
    fa fa7(A[7], B[7], carry[6], sum[7], Cout);

endmodule
