`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 18:16:11
// Design Name: 
// Module Name: mul_8bit
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


module mul_8bit(A,B,P,C);
    input [7:0] A,B;
    output [15:0] P;
    output C;

    wire signed [7:0] p0, p1, p2, p3, s1, s2, t1, t2;
    wire Cout1,Cout2,Cout3;
    wire HA_sum,HA_carry;


    mul_4bit m0(.a(A[3:0]), .b(B[3:0]), .r(p0));
    assign P[3:0] = p0[3:0];

    mul_4bit m1(.a(A[3:0]), .b(B[7:4]), .r(p1));
    mul_4bit m2(.a(A[7:4]), .b(B[3:0]), .r(p2));

    rca_8bit r1(.A(p1), .B(p2), .Cin(1'b0), .sum(s1), .Cout(Cout1));
    assign t1 = {4'b0000, p0[7:4]};

    rca_8bit r2(.A(s1), .B(t1), .Cin(1'b0), .sum(s2), .Cout(Cout2));

    ha ha1(.a(Cout1), .b(Cout2), .sum(HA_sum), .carry(HA_carry));
    assign P[7:4] = s2[3:0];

    mul_4bit m3(.a(A[7:4]), .b(B[7:4]), .r(p3));
    assign t2 = {2'b00, HA_sum, HA_carry, s2[7:4]};

    rca_8bit r3(.A(p3), .B(t2), .Cin(1'b0), .sum(P[15:8]), .Cout(Cout3));

    assign C = Cout3;
endmodule
