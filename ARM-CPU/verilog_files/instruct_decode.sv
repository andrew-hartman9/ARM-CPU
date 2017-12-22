// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// instruction decoder for pipelined CPU. Accepts an instruction, and 
// grabs all information needed for the next instruction fetch and 
// everything needed down the pipeline.
module instruct_decode (input not_clk, clk, reset, RegWrite_in, 
	negative, zero, overflow, carry_out, cbz_fwd, 
	input [4:0] WriteRegister_in, input [31:0] instruct_in, 
	input [63:0] alu_result_ID_in, WriteData_ID_in, addr_ID_in, 
	output logic store, write_enable_ID_out, RegWrite_ID_out, 
	memtoreg_sel_ID_out, flush_out, addr_sel_out, 
	output logic [2:0] cntrl_out, 
	output logic [ 4:0] ReadRegister1_out, ReadRegister2_out_UC, 
	ReadRegister2_ID_out, WriteRegister_ID_out, 
	output logic [63:0] ReadData1_out, ReadData2_ID_out, alu_src_out, 
	addr_ID_out);

	wire flush, RegWrite, write_enable, br_sel, memtoreg_sel, alu_addr_sel, 
	alu_src_sel, special_addr_sel, alu_link_sel, addr_sel;
	wire [2:0] cntrl;
	wire [4:0] ReadRegister1, ReadRegister2, ReadRegister1_out_temp, 
	ReadRegister2_out_temp, WriteRegister;
	wire [8:0] d_addr_raw;
	wire [11:0] alu_imm_raw;
	wire [18:0] cond_offset_raw;
	wire [25:0] br_offset_raw;
	wire [63:0] ReadData1, ReadData2, alu_imm_E, d_addr_E, alu_addr, 
	alu_src, br_addr, br_offset_S, br_offset_US, cond_offset_EX, 
	br_offset_EX, alu_link, special_addr, cbzfwd_out;
	// get current read register 2 for branching
	assign ReadRegister2_out_UC = ReadRegister2;
	// extend signals for adder
	sign_extender #(.WIDTH(19)) cond_addr_exr (.in(cond_offset_raw), 
		.out(cond_offset_EX));
	sign_extender #(.WIDTH(26)) br_addr_exr (.in(br_offset_raw), 
		.out(br_offset_EX));
	mux2_1 #(.WIDTH(64)) br_sel_mux 
	(.in({br_offset_EX, cond_offset_EX}), .sel(br_sel), 
		.out(br_offset_US));
	shifter addr_shift (.value(br_offset_US), .direction(1'b0), 
		.distance(6'b000010), .result(br_offset_S));
	adder br_calc (.A(br_offset_S), .B(addr_ID_in), .sum(br_addr));
	mux2_1 #(.WIDTH(64)) special_addr_sel_mux 
	(.in({ReadData2, br_addr}), .sel(special_addr_sel), 
		.out(special_addr));
	// regfile holds registers --
	regfile regfile (.ReadData1(ReadData1), .ReadData2(ReadData2), 
		.WriteData(WriteData_ID_in), .ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister_in), .RegWrite(RegWrite_in), 
		.clk(not_clk));
	sign_extender #(.WIDTH(12)) alu_imm_exr (.in(alu_imm_raw), 
		.out(alu_imm_E));
	sign_extender #(.WIDTH(9)) d_addr_exr (.in(d_addr_raw), 
		.out(d_addr_E));
	mux2_1 #(.WIDTH(64)) alu_addr_sel_mux (.in({alu_imm_E, d_addr_E}), 
		.sel(alu_addr_sel), .out(alu_addr));
	mux2_1 #(.WIDTH(64)) alu_link_sel_mux 
	(.in({ReadData2, addr_ID_in + 4}), .sel(alu_link_sel), 
		.out(alu_link));
	mux2_1 #(.WIDTH(64)) alu_src_sel_mux (.in({alu_link, alu_addr}), 
		.sel(alu_src_sel), .out(alu_src));
	mux2_1 #(.WIDTH(64)) cbzfwd_mux 
	(.in({alu_result_ID_in, ReadData2}), .sel(cbz_fwd), 
		.out(cbzfwd_out));
	// controller generates the control signals sent down the pipeline
	controller controller (._store(store), .rt(cbzfwd_out), .clk, 
		.reset, .negative(negative), .zero(zero), .overflow(overflow), 
		.carry_out(carry_out), .instruction(instruct_in), 
		.ReadRegister1(ReadRegister1), .ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), .RegWrite(RegWrite), 
		.alu_imm_raw(alu_imm_raw), .d_addr_raw(d_addr_raw), 
		.alu_addr_sel(alu_addr_sel), .alu_src_sel(alu_src_sel), 
		.write_enable(write_enable), .br_sel(br_sel), 
		.addr_sel(addr_sel), .cntrl(cntrl), 
		.cond_offset_raw(cond_offset_raw), 
		.br_offset_raw(br_offset_raw), .memtoreg_sel(memtoreg_sel), 
		.special_addr_sel(special_addr_sel), .flush(flush), 
		.alu_link_sel(alu_link_sel));
	// output control signals below here -----------------------------
	D_FF memtoreg_FF (.q(memtoreg_sel_ID_out),. d(memtoreg_sel), 
		.reset(reset), .clk(clk)); 
	D_FF write_enable_FF (.q(write_enable_ID_out), .d(write_enable), 
		.reset(reset), .clk(clk));
	D_FF regwrite_FF (.q(RegWrite_ID_out), .d(RegWrite), 
		.reset(reset), .clk(clk));
	D_FF addr_FF (.q(addr_sel_out), .d(addr_sel), .reset(reset), 
		.clk(clk));
	D_FF flush_FF (.q(flush_out), .d(flush), .reset(reset), 
		.clk(clk));
	generate
		genvar i;
		for (i = 0; i < 3; i++) begin : cntrlloop
			D_FF cntrl_FF (.q(cntrl_out[i]), .d(cntrl[i]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar j;
		for (j = 0; j < 5; j++) begin : label_2
			D_FF b (.q(ReadRegister1_out[j]), .d(ReadRegister1[j]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar k;
		for (k = 0; k < 5; k++) begin : label_3
			D_FF c (.q(ReadRegister2_ID_out[k]), .d(ReadRegister2[k]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar l;
		for (l = 0; l < 5; l++) begin : label_4
			D_FF d (.q(WriteRegister_ID_out[l]), .d(WriteRegister[l]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar o;
		for (o = 0; o < 64; o++) begin : label_7
			D_FF g (.q(ReadData1_out[o]), .d(ReadData1[o]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar p;
		for (p = 0; p < 64; p++) begin : label_8
			D_FF h (.q(ReadData2_ID_out[p]), .d(ReadData2[p]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
	generate
		genvar r;
		for (r = 0; r < 64; r++) begin : label_9
			D_FF z (.q(alu_src_out[r]), .d(alu_src[r]), .reset(reset), 
				.clk(clk));
		end
	endgenerate
	generate
		genvar m;
		for (m = 0; m < 64; m++) begin : label_35
			D_FF z (.q(addr_ID_out[m]), .d(special_addr[m]), 
				.reset(reset), .clk(clk));
		end
	endgenerate
endmodule
