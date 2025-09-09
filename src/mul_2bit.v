module mul_2bit(r, p0, p1, q0, q1);

input p0, p1, q0, q1;
output [3:0] r;
wire x, y, z, w;
wire sum1, carry1;
wire sum2, carry2;

assign x = p0 & q0;
assign y = p0 & q1;
assign z = p1 & q0;
assign w = p1 & q1;

ha dut1(.a(y), .b(z), .sum(sum1), .carry(carry1));
ha dut2(.a(carry1), .b(w), .sum(sum2), .carry(carry2));

assign r[0] = x;
assign r[1] = sum1;
assign r[2] = sum2;
assign r[3] = carry2;

endmodule
