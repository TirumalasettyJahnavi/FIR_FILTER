`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 15:17:58
// Design Name: 
// Module Name: dff_16bit
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


module dff_16bit (
    input clk,
    input reset,
    input [15:0] d,
    output reg [15:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 16'b0;
        else
            q <= d;
    end
endmodule
