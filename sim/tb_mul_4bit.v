`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 16:07:18
// Design Name: 
// Module Name: tb_mul_4bit
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


module tb_mul_4bit;

  reg [3:0] A_tb;
  reg [3:0] B_tb;
  wire [7:0] r_tb;

  mul_4bit dut (.a(A_tb), .b(B_tb), .r(r_tb));

  initial begin
    $display("########################################");
    repeat (10) begin
      A_tb = $random % 16;
      B_tb = $random % 16;
      #5;
      $display("A=%0d\tB=%0d\tR=%08b\tRdec=%0d\t", A_tb, B_tb, r_tb, r_tb);
    end
    $display("########################################");
  end

endmodule
