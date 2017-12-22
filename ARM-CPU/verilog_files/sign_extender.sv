// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// sign extends the input based on width to 64 bit output
module sign_extender #(parameter WIDTH=32) (input [WIDTH-1:0] in, 
	output [63:0] out);
	generate
		genvar i;
		for (i = 63; i > WIDTH - 1; i--) begin: upper_bits
			assign out[i] = in[WIDTH-1];
		end
	endgenerate
	assign out[WIDTH-1:0] = in; 
endmodule