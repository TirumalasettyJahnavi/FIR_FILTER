`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 15:19:04
// Design Name: 
// Module Name: tb_dff_16bit
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


module tb_dff_16bit;
    reg clock, reset, enable;
    reg [15:0] d;
    wire [15:0] q;

    dff_16bit dut (.clock(clock), .reset(reset), .enable(enable), .d(d), .q(q));

    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin
        reset = 1; enable = 0; d = 16'hAAAA; #12;
        reset = 0; enable = 1; d = 16'h1234; #10;
        d = 16'h5678; #10;
        enable = 0; d = 16'hFFFF; #10;
        enable = 1; d = 16'h0000; #10;
        reset = 1; #10;
        $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b reset=%b en=%b | d=%h -> q=%h", 
                  $time, clock, reset, enable, d, q);
    end
endmodule
