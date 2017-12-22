// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// a 2 to 1 multiplexor which outputs one of the inputs based on sel
module mux2_1 #(parameter WIDTH=64) (input [1:0][WIDTH-1:0] in, 
	input sel, output [WIDTH-1:0] out);
	wire [WIDTH-1:0] upperbit, lowerbit; 
	wire notsel;
	not #50 (notsel, sel);
	generate
		genvar i;
		for (i = 0; i < WIDTH; i++) begin : eachBit
			and #50 (lowerbit[i], in[0][i], notsel);
			and #50 (upperbit[i], in[1][i], sel);
			or #50 (out[i], upperbit[i], lowerbit[i]);
		end
	endgenerate
endmodule