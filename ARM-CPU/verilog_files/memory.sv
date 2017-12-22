// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// memory module for pipelined CPU. Handles reads and writes to main
// memory.
module memory (input clk, reset, write_enable_MEM_in, RegWrite_MEM_in, 
	memtoreg_sel_MEM_in, st_fwd_sel, input [4:0] WriteRegister_MEM_in, 
	input [63:0] ReadData2_MEM_in, alu_result_MEM_in, 
	output RegWrite_MEM_out, memtoreg_sel_MEM_out, 
	output [4:0] WriteRegister_MEM_out, 
	output [63:0] alu_result_MEM_out, mem_result_out);
	
	wire [63:0] mem_result, ReadData2_MEM_out, write_data;
	// main memory
	datamem datamem (.address(alu_result_MEM_in), 
		.write_enable(write_enable_MEM_in), .read_enable(1'b1), 
		.write_data(write_data), .clk(clk), .xfer_size(4'b1000), 
		.read_data(mem_result));
	// forwarding logic
	mux2_1 #(.WIDTH(64)) st_fwd_mux 
	(.in({alu_result_MEM_out, ReadData2_MEM_in}), .sel(st_fwd_sel), 
		.out(write_data));
	// passing pipeline signals below here ---------------------------
	D_FF memtoreg_FF (.q(memtoreg_sel_MEM_out), 
		.d(memtoreg_sel_MEM_in), .reset(reset), .clk(clk));
	D_FF RegWrite_FF (.q(RegWrite_MEM_out), .d(RegWrite_MEM_in), 
		.reset(reset), .clk(clk));
	generate
		genvar l;
		for (l = 0; l < 5; l++) begin : writeregloop
			D_FF WriteRegister_FF (.q(WriteRegister_MEM_out[l]), 
				.d(WriteRegister_MEM_in[l]), .reset(reset), 
				.clk(clk));
		end
	endgenerate
	generate
		genvar i;
		for (i = 0; i < 64; i++) begin : aluresloop
			D_FF alu_result_FF (.q(alu_result_MEM_out[i]), 
				.d(alu_result_MEM_in[i]), .reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar j;
		for (j = 0; j < 64; j++) begin : memresloop
			D_FF mem_result_FF (.q(mem_result_out[j]), 
				.d(mem_result[j]), .reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar k;
		for (k = 0; k < 64; k++) begin : readdataloop
			D_FF a (.q(ReadData2_MEM_out[k]), 
				.d(ReadData2_MEM_out[k]), .reset(reset), .clk(clk));
		end
	endgenerate
endmodule 