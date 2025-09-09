`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 18:33:34
// Design Name: 
// Module Name: tb_mul_16bit
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


module tb_mul_16bit;

  reg [15:0] A_tb;
  reg [15:0] B_tb;
  wire [31:0] P_tb;
  wire C_tb;

  // DUT instance
  mul_16bit dut (
    .A(A_tb),
    .B(B_tb),
    .P(P_tb),
    .C(C_tb)
  );

  initial begin
    $display("##############################");
    $monitor("A=%0d\tB=%0d\tP=%0d\tHexP=%h\tBinP=%b", A_tb, B_tb, P_tb, P_tb, P_tb);

    repeat (10) begin
      A_tb = $random % 65536;
      B_tb = $random % 65536;
      #20;
    end

    $display("##############################");
    #50 $finish;
  end

endmodule
