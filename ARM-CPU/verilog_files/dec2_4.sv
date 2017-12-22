// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// a 2 to 4 decoder without enable
module dec2_4 (input [1:0] in, output [3:0] out);
	wire [1:0] not_in;
	not #50 (not_in[0], in[0]);
	not #50 (not_in[1], in[1]);
	and #50 (out[0], not_in[0], not_in[1]);
	and #50 (out[1], in[0], not_in[1]);
	and #50 (out[2], not_in[0], in[1]);
	and #50 (out[3], in[0], in[1]);
endmodule