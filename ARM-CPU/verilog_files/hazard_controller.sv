// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// hazard controller for pipelined CPU. Controls forwarding based on
// data hazards
module hazard_controller (input store, input [4:0] ReadRegister_MEM, 
	ReadRegister2_in_UC, ReadRegister1_in, ReadRegister2_in, 
	WriteRegister_EX, WriteRegister_MEM, WriteRegister_WB, 
	input [63:0] ld_target, st_target, output logic fwd_a_1_sel_out, 
	fwd_a_2_sel_out, fwd_b_1_sel_out, fwd_b_2_sel_out, cbz_fwd, 
	st_fwd_sel);
	always_comb begin
		// reg data hazard
		if (ReadRegister2_in == WriteRegister_MEM && ReadRegister2_in 
		!= 31 && !store) begin
			fwd_b_1_sel_out = 1'b1;
		end else begin
			fwd_b_1_sel_out = 1'b0;
		end
		// delayed data hazard
		if (ReadRegister2_in == WriteRegister_WB && ReadRegister2_in 
		!= 31 && !store) begin
			fwd_b_2_sel_out = 1'b1;
		end else begin
			fwd_b_2_sel_out = 1'b0;
		end
		// reg data hazard
		if (ReadRegister1_in == WriteRegister_MEM && ReadRegister1_in 
		!= 31) begin
			fwd_a_1_sel_out = 1'b0;
		end else begin
			fwd_a_1_sel_out = 1'b1;
		end
		// delayed data hazard
		if (ReadRegister1_in == WriteRegister_WB && ReadRegister1_in 
		!= 31) begin
			fwd_a_2_sel_out = 1'b1;
		end else begin
			fwd_a_2_sel_out = 1'b0;
		end
		// branch hazard
		if (ReadRegister2_in_UC == WriteRegister_EX && 
		ReadRegister2_in_UC != 31) begin
			cbz_fwd = 1'b1;
		end else begin
			cbz_fwd = 1'b0;
		end 
		// store hazard
		if (ReadRegister_MEM == WriteRegister_WB && ReadRegister_MEM 
		!= 31) begin
			st_fwd_sel = 1'b1;
		end else begin
			st_fwd_sel = 1'b0;
		end
	end
endmodule