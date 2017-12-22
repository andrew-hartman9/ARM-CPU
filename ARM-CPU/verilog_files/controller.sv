// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// controller for instruction decode, which stores flags and sets
// controll signals that will be pushed down the pipeline
module controller (output logic _store, input [63:0] rt, input clk, 
	reset, negative, zero, overflow, carry_out, 
	input [31:0] instruction, output logic [4:0] ReadRegister1, 
	ReadRegister2, WriteRegister, output logic RegWrite, 
	output logic [11:0] alu_imm_raw, output logic [8:0] d_addr_raw, 
	output logic alu_addr_sel, alu_src_sel, write_enable, br_sel, 
	addr_sel, output logic [2:0] cntrl, 
	output logic [18:0] cond_offset_raw, 
	output logic [25:0] br_offset_raw, output logic memtoreg_sel, 
	special_addr_sel, flush, alu_link_sel);
	// controls then an instruction will read flags from alu
	logic flagwrite, _flagwrite, store;
	// clocked stateholding flags
	wire _negative, _zero, _overflow, _carry_out;
	// stateholders for flags, with async enables.
	D_FF_EN negative_FF (.in(negative), .en(_flagwrite), .clk(clk), 
		.async(1'b1), .out(_negative));
	D_FF_EN zero_FF (.in(zero), .en(_flagwrite), .clk(clk), 
		.async(1'b1), .out(_zero));
	D_FF_EN overflow_FF (.in(overflow), .en(_flagwrite), .clk(clk), 
		.async(1'b1), .out(_overflow));
	D_FF_EN carry_out_FF (.in(carry_out), .en(_flagwrite), .clk(clk), 
		.async(1'b1), .out(_carry_out));
	D_FF flagwrite_FF (.q(_flagwrite), .d(flagwrite), .reset(reset), 
		.clk(clk));
	D_FF store_FF (.q(_store), .d(store), .reset(reset), .clk(clk));

	// giant control logic block
	always_comb begin
		if (instruction[31:22] == 10'b1001000100) begin 
		// ADDI
			ReadRegister1 	= instruction[9:5];
			ReadRegister2 	= 5'bxxxxx;
			WriteRegister 	= instruction[4:0];
			RegWrite 		= 1'b1;
			alu_imm_raw 	= instruction[21:10];
			d_addr_raw 		= 9'bxxxxxxxxx;
			alu_addr_sel 	= 1'b1;
			alu_src_sel 	= 1'b0;
			write_enable 	= 1'b0;
			br_sel 			= 1'bx;
			addr_sel 		= 1'b0;
			cntrl 			= 3'b010;
			cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
			br_offset_raw 	= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
			memtoreg_sel	= 1'b0;
			special_addr_sel = 1'bx;
			flush			= 1'b0;
			alu_link_sel	= 1'b1;
			flagwrite		= 1'b0;
			store			= 1'b0;
		end else if (instruction[31:21] == 11'b10101011000) begin 
		// ADDS
			ReadRegister1 	= instruction[9:5];
			ReadRegister2 	= instruction[20:16];
			WriteRegister 	= instruction[4:0];
			RegWrite 		= 1'b1;
			alu_imm_raw 	= 12'bxxxxxxxxxxxx;;
			d_addr_raw 		= 9'bxxxxxxxxx;
			alu_addr_sel 	= 1'bx;
			alu_src_sel 	= 1'b1;
			write_enable 	= 1'b0;
			br_sel 			= 1'bx;
			addr_sel 		= 1'b0;
			cntrl 			= 3'b010;
			cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
			br_offset_raw 	= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
			memtoreg_sel	= 1'b0;
			special_addr_sel = 1'bx;
			flush			= 1'b0;
			alu_link_sel	= 1'b1;
			flagwrite		= 1'b1;
			store			= 1'b0;
		end else if (instruction[31:26] == 6'b000101) begin 
		// B
			ReadRegister1 	= 5'bxxxxx;
			ReadRegister2 	= 5'bxxxxx;
			WriteRegister 	= 5'bxxxxx;
			RegWrite 		= 1'b0;
			alu_imm_raw 	= 12'bxxxxxxxxxxxx;;
			d_addr_raw 		= 9'bxxxxxxxxx;
			alu_addr_sel 	= 1'bx;
			alu_src_sel 	= 1'bx;
			write_enable 	= 1'b0;
			br_sel 			= 1'b1;
			addr_sel 		= 1'b1;
			cntrl 			= 3'bxxx;
			cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
			br_offset_raw 	= instruction[25:0];
			memtoreg_sel	= 1'bx;
			special_addr_sel = 1'b0;
			flush			= 1'b1;
			alu_link_sel	= 1'b1;
			flagwrite		= 1'b0;
			store			= 1'b0;
		end else if (instruction[31:24] == 8'b01010100) begin 
		// B.LT
			if (_negative != _overflow) begin 
			// LT
				ReadRegister1 	= 5'bxxxxx;
				ReadRegister2 	= 5'bxxxxx;
				WriteRegister 	= 5'bxxxxx;
				RegWrite 		= 1'b0;
				alu_imm_raw 	= 12'bxxxxxxxxxxxx;;
				d_addr_raw 		= 9'bxxxxxxxxx;
				alu_addr_sel 	= 1'bx;
				alu_src_sel 	= 1'bx;
				write_enable 	= 1'b0;
				br_sel 			= 1'b0;
				addr_sel 		= 1'b1;
				cntrl 			= 3'bxxx;
				cond_offset_raw = instruction[23:5]; 
				br_offset_raw 	= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
				memtoreg_sel	= 1'bx;
				special_addr_sel = 1'b0;
				flush			= 1'b1;
				alu_link_sel	= 1'b1;
				flagwrite		= 1'b0;
				store			= 1'b0;
			end else begin
				ReadRegister1 	= 5'bxxxxx;
				ReadRegister2 	= 5'bxxxxx;
				WriteRegister 	= 5'bxxxxx;
				RegWrite 		= 1'b0;
				alu_imm_raw 	= 12'bxxxxxxxxxxxx;;
				d_addr_raw 		= 9'bxxxxxxxxx;
				alu_addr_sel 	= 1'bx;
				alu_src_sel 	= 1'bx;
				write_enable 	= 1'b0;
				br_sel 			= 1'bx;
				addr_sel 		= 1'b0;
				cntrl 			= 3'bxxx;
				cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
				br_offset_raw 	= instruction[25:0];
				memtoreg_sel	= 1'bx;
				special_addr_sel = 1'bx;
				flush			= 1'b0;
				alu_link_sel	= 1'b1;
				flagwrite		= 1'b0;
				store			= 1'b0;
			end
		end else if (instruction[31:26] == 6'b100101) begin 
		// BL
			ReadRegister1 	= 5'bxxxxx;
			ReadRegister2 	= 5'bxxxxx;
			WriteRegister 	= 5'b11110;
			RegWrite 		= 1'b1;
			alu_imm_raw 	= 12'bxxxxxxxxxxxx;
			d_addr_raw 		= 9'bxxxxxxxxx;
			alu_addr_sel 	= 1'bx;
			alu_src_sel 	= 1'b1;
			write_enable 	= 1'b0;
			br_sel			= 1'b1;
			addr_sel 		= 1'b1;
			cntrl 			= 3'b000;
			cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
			br_offset_raw 	= instruction[25:0];
			memtoreg_sel	= 1'b0;
			special_addr_sel = 1'b0;
			flush			= 1'b1;
			alu_link_sel	= 1'b0;
			flagwrite		= 1'b0;
			store			= 1'b0;
		end else if (instruction[31:21] == 11'b11010110000) begin 
		// BR
			ReadRegister1 	= 5'bxxxxx;
			ReadRegister2 	= instruction[4:0];
			WriteRegister 	= 5'bxxxxx;
			RegWrite 		= 1'b0;
			alu_imm_raw 	= 12'bxxxxxxxxxxxx;
			d_addr_raw 		= 9'bxxxxxxxxx;
			alu_addr_sel 	= 1'bx;
			alu_src_sel 	= 1'bx;
			write_enable 	= 1'b0;
			br_sel 			= 1'bx;
			addr_sel 		= 1'b1;
			cntrl 			= 3'bxxx;
			cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
			br_offset_raw 	= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
			memtoreg_sel	= 1'bx;
			special_addr_sel = 1'b1;
			flush			= 1'b1;
			alu_link_sel	= 1'b1;
			flagwrite		= 1'b0;
			store			= 1'b0;
		end else if (instruction[31:24] == 8'b10110100) begin 
		// CBZ
			ReadRegister2 	= instruction[4:0];
			ReadRegister1 	= 5'bxxxxx;
			WriteRegister 	= 5'bxxxxx;
			RegWrite 		= 1'b0;  
			alu_imm_raw 	= 12'bxxxxxxxxxxxx;;
			d_addr_raw 		= 9'bxxxxxxxxx;
			alu_addr_sel 	= 1'bx;
			alu_src_sel 	= 1'bx;
			write_enable	= 1'b0;
			cntrl 			= 3'bxxx;
			cond_offset_raw = instruction[23:5];
			br_offset_raw 	= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
			memtoreg_sel	= 1'bx;
			special_addr_sel = 1'b0;
			alu_link_sel	= 1'b1;
			flagwrite		= 1'b0;
			store			= 1'b0;
			if (rt == 64'h00000000) begin 
				br_sel 			= 1'b0;
				flush			= 1'b1;
				addr_sel 		= 1'b1;
			end else begin
				br_sel 			= 1'bx;
				flush			= 1'b0;
				addr_sel 		= 1'b0;
			end 
		end else if (instruction[31:21] == 11'b11111000010) begin
		// LDUR
			ReadRegister1 	= instruction[9:5];
			ReadRegister2 	= 5'bxxxxx;
			WriteRegister 	= instruction[4:0];
			RegWrite 		= 1'b1;
			alu_imm_raw 	= 12'bxxxxxxxxxxxx;
			d_addr_raw 		= instruction[20:12];
			alu_addr_sel 	= 1'b0;
			alu_src_sel 	= 1'b0;
			write_enable 	= 1'b0;
			br_sel			= 1'bx;
			addr_sel 		= 1'b0;
			cntrl 			= 3'b010;
			cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
			br_offset_raw 	= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;	
			memtoreg_sel	= 1'b1;	
			special_addr_sel = 1'bx;
			flush			= 1'b0;
			alu_link_sel	= 1'b1;
			flagwrite		= 1'b0;
			store			= 1'b0;
		end else if (instruction[31:21] == 11'b11111000000) begin
		// STUR
			ReadRegister1 	= instruction[9:5];
			ReadRegister2 	= instruction[4:0];
			WriteRegister 	= 5'bxxxxx;
			RegWrite 		= 1'b0;
			alu_imm_raw 	= 12'bxxxxxxxxxxxx;
			d_addr_raw 		= instruction[20:12];
			alu_addr_sel 	= 1'b0;
			alu_src_sel 	= 1'b0;
			write_enable 	= 1'b1;
			br_sel			= 1'bx;
			addr_sel 		= 1'b0;
			cntrl 			= 3'b010;
			cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
			br_offset_raw 	= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
			memtoreg_sel	= 1'bx;	
			special_addr_sel = 1'b0;
			flush			= 1'b0;	
			alu_link_sel	= 1'b1;
			flagwrite		= 1'b0;
			store			= 1'b1;
		end else if (instruction[31:21] == 11'b11101011000) begin
		// SUBS
			ReadRegister1 	= instruction[9:5];
			ReadRegister2 	= instruction[20:16];
			WriteRegister 	= instruction[4:0];
			RegWrite 		= 1'b1;
			alu_imm_raw 	= 12'bxxxxxxxxxxxx;;
			d_addr_raw 		= 9'bxxxxxxxxx;
			alu_addr_sel 	= 1'bx;
			alu_src_sel 	= 1'b1;
			write_enable 	= 1'b0;
			br_sel 			= 1'bx;
			addr_sel 		= 1'b0;
			cntrl 			= 3'b011;
			cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
			br_offset_raw 	= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
			memtoreg_sel	= 1'b0;
			special_addr_sel = 1'b0;
			flush			= 1'b0;
			alu_link_sel	= 1'b1;
			flagwrite		= 1'b1;
			store			= 1'b0;
		end else begin 
		// NOOP
			ReadRegister1 	= 5'bxxxxx;
			ReadRegister2 	= 5'bxxxxx;
			WriteRegister 	= 5'bxxxxx;
			RegWrite 		= 1'b0;
			alu_imm_raw 	= 12'bxxxxxxxxxxxx;;
			d_addr_raw 		= 9'bxxxxxxxxx;
			alu_addr_sel 	= 1'bx;
			alu_src_sel 	= 1'bx;
			write_enable 	= 1'b0;
			br_sel 			= 1'bx;
			addr_sel 		= 1'b0;
			cntrl 			= 3'bxxx;
			cond_offset_raw = 19'bxxxxxxxxxxxxxxxxxxx; 
			br_offset_raw 	= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
			memtoreg_sel	= 1'bx;	
			special_addr_sel = 1'b0;
			flush			= 1'b0;
			alu_link_sel	= 1'b1;
			flagwrite		= 1'b0;
			store			= 1'b0;
		end
	end
endmodule