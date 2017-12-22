// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// execution module in pipelined cpu. Performs any alu operations that
// the given instruction needs.
module execution (input clk, reset, RegWrite_EX_in, 
	write_enable_EX_in, fwd_a_1_sel_in, fwd_a_2_sel_in, 
	fwd_b_1_sel_in, fwd_b_2_sel_in, memtoreg_sel_EX_in, 
	input [2:0] cntrl_in, input [4:0] WriteRegister_EX_in, 
	ReadRegister2_EX_in, input [63:0] ReadData1_in, ReadData2_EX_in, 
	alu_src_in, WriteData_EX_in, output write_enable_EX_out, 
	RegWrite_EX_out, negative, zero, overflow, carry_out, 
	memtoreg_sel_EX_out, output [4:0] WriteRegister_EX_out, 
	ReadRegister2_EX_out, output [63:0] ReadData2_EX_out, 
	alu_result_EX_out);
	// forwarding selectors and result
	wire [63:0] fwd_a_1, fwd_b_1, fwd_a_2, fwd_b_2, alu_result;
	mux2_1 #(.WIDTH(64)) fwd_a_1_sel_mux 
	(.in({ReadData1_in, alu_result_EX_out}), .sel(fwd_a_1_sel_in), 
		.out(fwd_a_1));
	mux2_1 #(.WIDTH(64)) fwd_b_1_sel_mux 
	(.in({alu_result_EX_out, alu_src_in}), .sel(fwd_b_1_sel_in), 
		.out(fwd_b_1));
	mux2_1 #(.WIDTH(64)) fwd_a_2_sel_mux 
	(.in({WriteData_EX_in, fwd_a_1}), .sel(fwd_a_2_sel_in), 
		.out(fwd_a_2));
	mux2_1 #(.WIDTH(64)) fwd_b_2_sel_mux 
	(.in({WriteData_EX_in, fwd_b_1}), .sel(fwd_b_2_sel_in), 
		.out(fwd_b_2));
	alu alu (.A(fwd_a_2), .B(fwd_b_2), .cntrl(cntrl_in), 
		.result(alu_result), .negative(negative), .zero(zero), 
		.overflow(overflow), .carry_out(carry_out));
	D_FF zz (.q(memtoreg_sel_EX_out), .d(memtoreg_sel_EX_in), 
		.reset(reset), .clk(clk));
	D_FF aa (.q(write_enable_EX_out), .d(write_enable_EX_in), 
		.reset(reset), .clk(clk));
	D_FF cc (.q(RegWrite_EX_out), .d(RegWrite_EX_in), .reset(reset), 
		.clk(clk));
	generate
		genvar l;
		for (l = 0; l < 5; l++) begin : label_1
			D_FF d (.q(WriteRegister_EX_out[l]), 
				.d(WriteRegister_EX_in[l]), .reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar p;
		for (p = 0; p < 64; p++) begin : label_2
			D_FF h (.q(ReadData2_EX_out[p]), .d(ReadData2_EX_in[p]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar i;
		for (i = 0; i < 64; i++) begin : label_3
			D_FF a (.q(alu_result_EX_out[i]), .d(alu_result[i]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar j;
		for (j = 0; j < 5; j++) begin : label_sdf
			D_FF asd (.q(ReadRegister2_EX_out[j]), 
				.d(ReadRegister2_EX_in[j]), .reset(reset), .clk(clk));
		end
	endgenerate
endmodule