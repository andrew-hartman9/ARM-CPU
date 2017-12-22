// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// single bit of the alu
module alu_slice (input a, b, c_in, b_inv, input [2:0] sel, 
	output c_out, result);
	wire [7:0] results_wire;
	wire add_sub, sel_b, not_b;
	assign results_wire[2] = add_sub;
	assign results_wire[3] = add_sub;
	assign results_wire[0] = b;
	not #50 (not_b, b);
	mux2_1 #(.WIDTH(1)) b_sel (.in({not_b, b}), .sel(b_inv), 
		.out(sel_b));
	adder_slice adder_slice (.a(a), .b(sel_b), .carry_in(c_in), 
		.sum(add_sub), .carry_out(c_out));
	and #50 (results_wire[4], a, b);
	or #50 (results_wire[5], a, b);
	xor #50 (results_wire[6], a, b);
	assign results_wire[1] = 1'bx;
	assign results_wire[7] = 1'bx;
	mux8_1 #(.WIDTH(1)) result_sel (.in(results_wire), .sel(sel), 
		.out(result));
endmodule