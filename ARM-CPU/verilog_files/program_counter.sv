// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// program counter which keeps track of the current address and 
// increments it to the next address every clock cycle.
module program_counter (output [63:0] address, input [63:0] next, 
	input clk, input reset);
	// single FF for each bit of the address
	generate
		genvar i;
		for (i = 0; i < 64; i++) begin : D_FF_loop
			D_FF address_state (.q(address[i]), .d(next[i]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
endmodule