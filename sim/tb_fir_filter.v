`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025
// Design Name: 
// Module Name: tb_fir_filter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for FIR Filter with Q1.15 Coefficients
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_fir_filter;

  reg clk;
  reg reset;
  reg signed [15:0] x;
  wire signed [31:0] y;

  // Instantiate DUT
  fir_filter dut (
    .clk(clk),
    .reset(reset),
    .xin(x),
    .yout(y)
  );

  // Clock generation: 100MHz (10ns period)
  always #5 clk = ~clk;

  integer i;

  initial begin
    $display("################ FIR 64-Tap Filter Simulation ################");
    $display("Time\tClk\tReset\tX\tY");
    $monitor("%0t\t%b\t%b\t%d\t%d", $time, clk, reset, x, y);

    // Initial values
    clk = 0;
    reset = 1;
    x = 0;

    // Apply reset
    #10;
    reset = 0;

    // Apply 70 input samples (0 to 69)
    for (i = 0; i < 70; i = i + 1) begin
      x = i;
      #10;
    end

    // Wait a bit before finishing
    #50;
    $display("################ Simulation Finished ################");
    $finish;
  end

endmodule
