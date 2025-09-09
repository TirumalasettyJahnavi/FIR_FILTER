`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 18:39:18
// Design Name: 
// Module Name: fir_filter
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
// 64-Tap FIR Filter
// Architecture: Direct Form FIR
// Format: Q1.15 Coefficients, 16-bit signed input, 32-bit signed output
//////////////////////////////////////////////////////////////////////////////////

module fir_filter (
    input clk,
    input reset,
    input [15:0] xin,
    output [31:0] yout
);

// Internal Signals
wire signed [15:0] x[0:63];
wire signed [31:0] p[0:63];
wire signed [31:0] s[0:63];

// Coefficient ROM (Q1.15)
(* rom_style = "distributed" *) reg signed [15:0] h[0:63];
integer j;
initial begin
    h[0]  = 16'h0000; h[1]  = 16'h0005; h[2]  = 16'h0000; h[3]  = 16'hFFFD;
    h[4]  = 16'hFFF9; h[5]  = 16'hFFFA; h[6]  = 16'h0000; h[7]  = 16'h000A;
    h[8]  = 16'h0012; h[9]  = 16'h001F; h[10] = 16'h0014; h[11] = 16'hFFE3;
    h[12] = 16'hFFB6; h[13] = 16'hFFA3; h[14] = 16'hFFCD; h[15] = 16'h0000;
    h[16] = 16'h004C; h[17] = 16'h0095; h[18] = 16'h0085; h[19] = 16'h0000;
    h[20] = 16'hFEAD; h[21] = 16'hFCBC; h[22] = 16'h17D3; h[23] = 16'h17F6;
    h[24] = 16'h17F6; h[25] = 16'h17D3; h[26] = 16'hFCBC; h[27] = 16'hFEAD;
    h[28] = 16'h0000; h[29] = 16'h0085; h[30] = 16'h0095; h[31] = 16'h004C;
    h[32] = 16'h0000; h[33] = 16'hFFCD; h[34] = 16'hFFA3; h[35] = 16'hFFB6;
    h[36] = 16'hFFE3; h[37] = 16'h0014; h[38] = 16'h001F; h[39] = 16'h0012;
    h[40] = 16'h000A; h[41] = 16'h0000; h[42] = 16'hFFFA; h[43] = 16'hFFF9;
    h[44] = 16'hFFFD; h[45] = 16'h0000; h[46] = 16'h0005; h[47] = 16'h0000;
    h[48] = 16'h0000; h[49] = 16'h0005; h[50] = 16'h0000; h[51] = 16'hFFFD;
    h[52] = 16'hFFF9; h[53] = 16'hFFFA; h[54] = 16'h0000; h[55] = 16'h000A;
    h[56] = 16'h0012; h[57] = 16'h001F; h[58] = 16'h0014; h[59] = 16'hFFE3;
    h[60] = 16'h0000; h[61] = 16'h0000; h[62] = 16'h0000; h[63] = 16'h0000;
end

assign x[0] = xin;

// Shift Register for Delay Line
genvar i;
generate
    for (i = 1; i < 64; i = i + 1) begin : shift
        dff_16bit dff_inst (.clk(clk), .reset(reset), .d(x[i-1]), .q(x[i]));
    end
endgenerate

// Multipliers: p[i] = h[i] * x[i]
generate
    for (i = 0; i < 64; i = i + 1) begin : muls
        mul_16bit mul_inst (.A(x[i]), .B(h[i]), .P(p[i]), .C());
    end
endgenerate

// Accumulation using RCA tree
assign s[0] = p[0];
generate
    for (i = 1; i < 64; i = i + 1) begin : adders
        rca_16bit add_inst (.a(s[i-1]), .b(p[i]), .c(1'b0), .sum(s[i]), .carry());
    end
endgenerate

assign yout = s[63];

endmodule
