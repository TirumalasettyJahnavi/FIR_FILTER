`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 18:31:54
// Design Name: 
// Module Name: mul_16bit
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


module mul_16bit(A, B, P, C);
input signed [15:0] A, B;
output signed [31:0] P;

  output C;

    wire signed [15:0] p0, p1, p2, p3;
    wire signed [15:0] s1, s2;
    wire signed [15:0] t1, t2;

  wire Cout1, Cout2, Cout3;
  wire HA_sum, HA_carry;;

  mul_8bit m0(.A(A[7:0]),   .B(B[7:0]),   .P(p0));
  assign P[7:0] = p0[7:0];

  mul_8bit m1(.A(A[7:0]),   .B(B[15:8]),  .P(p1));
  mul_8bit m2(.A(A[15:8]),  .B(B[7:0]),   .P(p2));

  rca_16bit r1(.a(p1), .b(p2), .c(1'b0), .sum(s1), .carry(Cout1));
  assign t1 = {8'b00000000, p0[15:8]};

  rca_16bit r2(.a(s1), .b(t1), .c(1'b0), .sum(s2), .carry(Cout2));

  ha ha1(.a(Cout1), .b(Cout2), .sum(HA_sum), .carry(HA_carry));
  assign P[15:8] = s2[7:0];

  mul_8bit m3(.A(A[15:8]), .B(B[15:8]), .P(p3));
  assign t2 = {s2[15:8], HA_carry, HA_sum}; // or pad with zeros as needed

  rca_16bit r3(.a(p3), .b(t2), .c(1'b0), .sum(P[31:16]), .carry(Cout3));
  assign C = Cout3;
endmodule
