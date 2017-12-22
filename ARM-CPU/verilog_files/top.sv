// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// top level module for a pipelined CPU running a subset of the ARM
// instruction set. Programs can be run by placing them in benchmarks.
module top (input clk, reset);
	// control signals and flags
	wire store, cbz_fwd, not_clk, addr_sel, write_enable_1, 
	write_enable_2, RegWrite_1, RegWrite_2, RegWrite_3, fwd_a_1_sel, 
	fwd_a_2_sel, fwd_b_1_sel, fwd_b_2_sel, negative, zero, overflow, 
	carry_out, memtoreg_sel_1, memtoreg_sel_2, memtoreg_sel_3, flush, 
	st_fwd_sel;
	// alu control signal
	wire [2:0] cntrl;
	// read and write register values
	wire [4:0] ReadRegister1, ReadRegister2_1, ReadRegister2_2, 
	WriteRegister_2, WriteRegister_3, WriteRegister_1, 
	ReadRegister2_UC, ReadRegister_MEM_in;
	// current instruction
	wire [31:0] instruct;
	// addresses and data values
	wire [63:0] addr_1, addr_2, alu_result_1, ReadData1, ReadData2_1, 
	alu_src, WriteData, ReadData2_2, alu_result_2, mem_result;

	// inverted clock for regfile
	not #50 (not_clk, clk);

	// deal with forwarding and other hazards
	hazard_controller hazard_controller (.store(store), 
		.ReadRegister_MEM(ReadRegister2_2), 
		.ReadRegister2_in_UC(ReadRegister2_UC), 
		.ReadRegister1_in(ReadRegister1), 
		.ReadRegister2_in(ReadRegister2_1), 
		.WriteRegister_EX(WriteRegister_1), 
		.WriteRegister_MEM(WriteRegister_2), 
		.WriteRegister_WB(WriteRegister_3), .ld_target(alu_result_1), 
		.st_target(alu_result_2), .fwd_a_1_sel_out(fwd_a_1_sel), 
		.fwd_a_2_sel_out(fwd_a_2_sel), .fwd_b_1_sel_out(fwd_b_1_sel), 
		.fwd_b_2_sel_out(fwd_b_2_sel), .cbz_fwd(cbz_fwd), 
		.st_fwd_sel(st_fwd_sel));

	// fetch the next instruction
	instruct_fetch instruct_fetch (.clk, .reset, 
		.addr_sel_in(addr_sel), .flush(flush), .addr_IF_in(addr_2), 
		.instruct_out(instruct), .addr_IF_out(addr_1));

	// decode the instruction and set appropriate control signals and 
	// grab reg values
	instruct_decode instruct_decode (.not_clk, .clk, .reset, 
		.RegWrite_in(RegWrite_3), .negative, .zero, .overflow, 
		.carry_out, .cbz_fwd(cbz_fwd), 
		.WriteRegister_in(WriteRegister_3), .instruct_in(instruct), 
		.alu_result_ID_in(alu_result_1), .WriteData_ID_in(WriteData), 
		.addr_ID_in(addr_1), .store(store), 
		.write_enable_ID_out(write_enable_1),
		.RegWrite_ID_out(RegWrite_1), 
		.memtoreg_sel_ID_out(memtoreg_sel_1), .flush_out(flush), 
		.addr_sel_out(addr_sel), .cntrl_out(cntrl), 
		.ReadRegister1_out(ReadRegister1), 
		.ReadRegister2_out_UC(ReadRegister2_UC), 
		.ReadRegister2_ID_out(ReadRegister2_1), 
		.WriteRegister_ID_out(WriteRegister_1), 
		.ReadData1_out(ReadData1), .ReadData2_ID_out(ReadData2_1), 
		.alu_src_out(alu_src), .addr_ID_out(addr_2));

	// execute and alu operations needed for the given instruction
	execution execution (.clk, .reset, .RegWrite_EX_in(RegWrite_1), 
		.write_enable_EX_in(write_enable_1), 
		.fwd_a_1_sel_in(fwd_a_1_sel), .fwd_a_2_sel_in(fwd_a_2_sel), 
		.fwd_b_1_sel_in(fwd_b_1_sel), .fwd_b_2_sel_in(fwd_b_2_sel), 
		.memtoreg_sel_EX_in(memtoreg_sel_1), .cntrl_in(cntrl), 
		.WriteRegister_EX_in(WriteRegister_1), 
		.ReadRegister2_EX_in(ReadRegister2_1), 
		.ReadData1_in(ReadData1), .ReadData2_EX_in(ReadData2_1), 
		.alu_src_in(alu_src), .WriteData_EX_in(WriteData), 
		.write_enable_EX_out(write_enable_2), 
		.RegWrite_EX_out(RegWrite_2), .negative(negative), 
		.zero(zero), .overflow(overflow), .carry_out(carry_out), 
		.memtoreg_sel_EX_out(memtoreg_sel_2), 
		.WriteRegister_EX_out(WriteRegister_2), 
		.ReadRegister2_EX_out(ReadRegister2_2), 
		.ReadData2_EX_out(ReadData2_2), 
		.alu_result_EX_out(alu_result_1));

	// read and write to memory if the instruction needs it
	memory memory (.clk, .reset, .write_enable_MEM_in(write_enable_2), 
		.RegWrite_MEM_in(RegWrite_2), 
		.memtoreg_sel_MEM_in(memtoreg_sel_2), .st_fwd_sel(st_fwd_sel), 
		.WriteRegister_MEM_in(WriteRegister_2), 
		.ReadData2_MEM_in(ReadData2_2), 
		.alu_result_MEM_in(alu_result_1), 
		.RegWrite_MEM_out(RegWrite_3), 
		.memtoreg_sel_MEM_out(memtoreg_sel_3), 
		.WriteRegister_MEM_out(WriteRegister_3), 
		.alu_result_MEM_out(alu_result_2), 
		.mem_result_out(mem_result));

	// write the value produced by the instruction to the write reg
	write_back write_back (.clk, .reset, 
		.memtoreg_sel_WB_in(memtoreg_sel_3), 
		.mem_result_in(mem_result), .alu_result_WB_in(alu_result_2), 
		.WriteData_out(WriteData));
endmodule

module top_testbench ();
	parameter ClockDelay = 100000;
	reg clk, reset;
	top dut (clk, reset);
	integer i;
	initial begin
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	initial begin
		reset <= 1;
		@(posedge clk);
		reset <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		$stop;
	end
endmodule