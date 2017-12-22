// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// adder which computers the sum of two numbers. Does not watch for 
// overflow or other flags.
module adder (input [63:0] A, B, output [63:0] sum);
	wire [64:0] carry;
	assign carry[0] = 0;
	generate
		genvar i;
		for (i = 0; i < 64; i++) begin : adder_loop
			adder_slice adder_slice (.a(A[i]), .b(B[i]), 
				.carry_in(carry[i]), .sum(sum[i]), 
				.carry_out(carry[i + 1]));
		end
	endgenerate
endmodule