// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// a 5 to 32 decoder with enable
module dec5_32 (input [4:0] in, input en, output [31:0] out);
	wire [3:0] enables;
	wire [31:0] hold;
	dec2_4 sel_decoder (.in(in[4:3]), .out(enables));
	dec3_8 bottom_8 (.in(in[2:0]), .en(enables[0]), .out(hold[7:0]));
	dec3_8 low_8 (.in(in[2:0]), .en(enables[1]), .out(hold[15:8]));
	dec3_8 high_8 (.in(in[2:0]), .en(enables[2]), .out(hold[23:16]));
	dec3_8 top_8 (.in(in[2:0]), .en(enables[3]), .out(hold[31:24]));
	generate
		genvar i;
		for (i = 0; i < 32; i++)  begin : label
			and #50 (out[i], hold[i], en);
		end
	endgenerate
endmodule