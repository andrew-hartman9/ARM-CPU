// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// alu capable of performing addition, passthrough, and subtraction
// for use in CPUs
module alu (input [63:0] A, B, input [2:0] cntrl, 
	output [63:0] result, output negative, zero, overflow, carry_out);	
	wire [64:0] c;
	assign negative = result[63];
	assign carry_out = c[64];
	and #50 (c[0], cntrl[0], cntrl[1]);
	generate
		genvar i;
		for(i = 0; i < 64; i++) begin : label
			alu_slice alu_slice (.a(A[i]), .b(B[i]), .c_in(c[i]), 
				.b_inv(c[0]), .sel(cntrl), .c_out(c[i + 1]), 
				.result(result[i]));
		end
	endgenerate
	all_zero zeroer (.in(result), .zero);
	xor #50 (overflow, c[63], c[64]);
endmodule
	