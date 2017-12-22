// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// write back module for pipelined CPU. Controls register writing and
// which location things get written to.
module write_back (input clk, reset, memtoreg_sel_WB_in, 
	input [63:0] mem_result_in, alu_result_WB_in, 
	output [63:0] WriteData_out);
	wire [63:0] memtoreg;
	// which value gets written
	mux2_1 #(.WIDTH(64)) memtoreg_sel_mux 
	(.in({mem_result_in, alu_result_WB_in}), .sel(memtoreg_sel_WB_in), 
		.out(WriteData_out));
endmodule