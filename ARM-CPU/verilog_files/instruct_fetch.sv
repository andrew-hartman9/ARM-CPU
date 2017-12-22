// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// instruction fetch module for pipelined CPU. Keeps track of the 
// current instruction address and handles incrementing it and
// branching.
module instruct_fetch (input clk, reset, addr_sel_in, flush, 
	input [63:0] addr_IF_in, output [31:0] instruct_out, 
	output [63:0] addr_IF_out);
	wire [63:0] addr, next_addr, inc_addr;
	wire [31:0] instruct, instruct_temp;
	wire not_flush, next_flush;
	adder inc_calc (.A(addr), .B(64'h00000004), .sum(inc_addr));
	mux2_1 #(.WIDTH(64)) addr_sel_mux (.in({addr_IF_in, inc_addr}), 
		.sel(addr_sel_in), .out(next_addr));
	program_counter PC (.address(addr), .next(next_addr), .clk(clk), 
		.reset(reset));
	instructmem IMEM (.address(addr), .instruction(instruct), 
		.clk(clk));
	not #50 (not_flush, flush);
	// if flush, turn next instruct to noop
	generate
		genvar k;
		for (k = 0; k < 32; k++) begin : label_1
			and #50 (instruct_temp[k], instruct[k], not_flush);
		end
	endgenerate
	generate
		genvar i;
		for (i = 0; i < 64; i++) begin : label_z
			D_FF flip1 (.q(addr_IF_out[i]), .d(addr[i]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar j;
		for (j = 0; j < 32; j++) begin : label_2
			D_FF flip2 (.q(instruct_out[j]), .d(instruct_temp[j]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
endmodule 