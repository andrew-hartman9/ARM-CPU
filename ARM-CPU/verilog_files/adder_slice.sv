// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// single bit of the larger adder unit.
module adder_slice (input a, b, carry_in, output sum, carry_out);
	wire ab_sum, sum_carry, ab_carry;
	xor #50 (ab_sum, a, b);
	xor #50 (sum, ab_sum, carry_in);
	and #50 (sum_carry, ab_sum, carry_in);
	and #50 (ab_carry, a, b);
	or #50 (carry_out, sum_carry, ab_carry);
endmodule