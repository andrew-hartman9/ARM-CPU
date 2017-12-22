// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// sets zero when every bit of the input signal is zero
module all_zero (input [63:0] in, output zero);
	wire [15:0] step_down_1; 
	wire [3:0] step_down_2;
	generate
		genvar i;
		for(i = 0; i < 16; i++) begin: first_step
			nor #50 (step_down_1[i], in[0 + (i * 4)], in[1 + (i * 4)], 
				in[2 + (i * 4)], in[3 + (i * 4)]);
		end
	endgenerate
	generate
		genvar j;
		for(j = 0; j < 4; j++) begin: second_step
			and #50 (step_down_2[j], step_down_1[0 + (j * 4)], 
				step_down_1[1 + (j * 4)], step_down_1[2 + (j * 4)], 
				step_down_1[3 + (j * 4)]);
		end
	endgenerate
	and #50 (zero, step_down_2[0], step_down_2[1], step_down_2[2], 
		step_down_2[3]);
endmodule
	