// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// a 32 to 1 multiplexor which outputs one of the inputs based on sel
module mux32_1 (input [31:0][63:0] in, input [4:0] sel, 
	output [63:0] out);
	wire [63:0] upper_bits_16, lower_bits_16;
	wire [63:0] upper_bits_8_high, upper_bits_8_low, 
	lower_bits_8_high, lower_bits_8_low;
	mux8_1 #(.WIDTH(64)) upper_bits_8_high_mux (.in(in[31:24]), 
		.sel(sel[2:0]), .out(upper_bits_8_high));
	mux8_1 #(.WIDTH(64)) upper_bits_8_low_mux (.in(in[23:16]), 
		.sel(sel[2:0]), .out(upper_bits_8_low));
	mux8_1 #(.WIDTH(64)) lower_bits_8_high_mux (.in(in[15:8]), 
		.sel(sel[2:0]), .out(lower_bits_8_high));
	mux8_1 #(.WIDTH(64)) lower_bits_8_low_mux (.in(in[7:0]), 
		.sel(sel[2:0]), .out(lower_bits_8_low));
	mux2_1 #(.WIDTH(64)) upper_bits_16_mux 
	(.in({upper_bits_8_high, upper_bits_8_low}), .sel(sel[3]), 
		.out(upper_bits_16));
	mux2_1 #(.WIDTH(64)) lower_bits_16_mux 
	(.in({lower_bits_8_high, lower_bits_8_low }), .sel(sel[3]), 
		.out(lower_bits_16));
	mux2_1 #(.WIDTH(64)) out_mux (.in({upper_bits_16, lower_bits_16}), 
		.sel(sel[4]), .out(out));
endmodule