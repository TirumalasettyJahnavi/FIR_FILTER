`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 15:58:32
// Design Name: 
// Module Name: mul_4bit
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

module mul_4bit (
    input signed [3:0] a,
    input signed [3:0] b,
    output signed [7:0] r
);
    assign r = a * b;
endmodule
