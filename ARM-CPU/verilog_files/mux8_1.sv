// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// a 8 to 1 multiplexor which outputs one of the inputs based on sel
module mux8_1 #(parameter WIDTH=64) (input [7:0][WIDTH-1:0] in, 
	input [2:0] sel, output [WIDTH-1:0] out);
	wire [WIDTH-1:0] upper_bits, lower_bits, top_2, high_2, low_2, 
	bottom_2;
	mux2_1 #(.WIDTH(WIDTH)) top_2_mux (.in({in[7], in[6]}), 
		.sel(sel[0]), .out(top_2));
	mux2_1 #(.WIDTH(WIDTH)) high_2_mux (.in({in[5], in[4]}), 
		.sel(sel[0]), .out(high_2));
	mux2_1 #(.WIDTH(WIDTH)) low_2_mux (.in({in[3], in[2]}), 
		.sel(sel[0]), .out(low_2));
	mux2_1 #(.WIDTH(WIDTH)) bottom_2_mux (.in({in[1], in[0]}), 
		.sel(sel[0]), .out(bottom_2));
	mux2_1 #(.WIDTH(WIDTH)) upper_bits_mux (.in({top_2, high_2}), 
		.sel(sel[1]), .out(upper_bits));
	mux2_1 #(.WIDTH(WIDTH)) lower_bits_mux (.in({low_2, bottom_2}), 
		.sel(sel[1]), .out(lower_bits));
	mux2_1 #(.WIDTH(WIDTH)) out_mux (.in({upper_bits, lower_bits}), 
		.sel(sel[2]), .out(out));
endmodule