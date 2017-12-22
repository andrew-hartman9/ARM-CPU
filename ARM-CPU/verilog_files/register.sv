// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// single register in larger register file holding 64 bit values
module register (input write_enable, clk, input [63:0] in, 
	output [63:0] out);
	// 64 bits for holding values
	generate
		genvar i;
		for (i = 0; i < 64; i++)  begin : each_bit
			D_FF_EN single_bit (.in(in[i]), .en(write_enable), 
				.clk(clk), .async(1'b0), .out(out[i]));
		end
	endgenerate
endmodule