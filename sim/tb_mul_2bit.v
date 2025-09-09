
module tb_mul_2bit;

reg p0_tb, p1_tb;
reg q0_tb, q1_tb;
wire [3:0] r_tb;

mul_2bit dut(.p0(p0_tb), .p1(p1_tb), .q0(q0_tb), .q1(q1_tb), .r(r_tb));

integer a, b;

initial begin
    $display("########################################");
    repeat (10) begin
        p0_tb = $random & 1; #10;
        p1_tb = $random & 1; #10;
        q0_tb = $random & 1; #10;
        q1_tb = $random & 1; #10;
        a = {p1_tb, p0_tb};
        b = {q1_tb, q0_tb};
        $display("A0=%01b\tA1=%01b\tB0=%01b\tB1=%01b\tR=%04b\ta=%0d\tb=%0d\trDec=%0d\t", 
                 p0_tb, p1_tb, q0_tb, q1_tb, r_tb, a, b, r_tb);
    end
    $display("########################################");
end


endmodule
