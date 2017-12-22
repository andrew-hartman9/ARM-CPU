// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// a 3 to 8 decoder with enable
module dec3_8 (input [2:0] in, input en, output [7:0] out);
	wire [2:0] not_in;
	not #50 (not_in[2], in[2]);
	not #50 (not_in[1], in[1]);
	not #50 (not_in[0], in[0]);
	and #50 (out[0], not_in[0], not_in[1], not_in[2], en);
	and #50 (out[1], in[0], not_in[1], not_in[2], en);
	and #50 (out[2], not_in[0], in[1], not_in[2], en);	
	and #50 (out[3], in[0], in[1], not_in[2], en);
	and #50 (out[4], not_in[0], not_in[1], 	in[2], en);
	and #50 (out[5], in[0], not_in[1], 	in[2], en);
	and #50 (out[6], not_in[0], in[1], in[2], en);
	and #50 (out[7], in[0], in[1], in[2],  en);
endmodule