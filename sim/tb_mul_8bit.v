`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 18:20:02
// Design Name: 
// Module Name: tb_mul_8bit
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


module tb_mul_8bit;
  reg [7:0] A_tb;
  reg [7:0] B_tb;
  wire [15:0] P_tb;
  wire C_tb;

  mul_8bit dut(.A(A_tb), .B(B_tb), .P(P_tb), .C(C_tb));

  initial begin
    $display("##############################");
    $monitor("A=%0d\tB=%0d\tP=%0d\tBin=%08b\tBdec=%d", A_tb, B_tb, P_tb, P_tb, P_tb);

    repeat(10) begin
      A_tb = $random % 256;
      B_tb = $random % 256;
      #20;
    end

    $display("##############################");
    #50 $finish;
  end
endmodule
