// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// module holding all registers, with 2 read write ports and enable
module regfile (output [63:0] ReadData1, ReadData2, 
	input [63:0] WriteData, input [4:0] ReadRegister1, ReadRegister2, 
	WriteRegister, input RegWrite, clk);
	wire [31:0] write_enable;
	wire [31:0][63:0] reg_out;
	// decode the write signal and combine it with the write enable
	dec5_32 write_enable_decoder (.in(WriteRegister), .en(RegWrite), 
		.out(write_enable));
	// generate the 31 registers
	generate
		genvar i;
		for (i = 0; i < 31; i++)  begin : label
			register register (.write_enable(write_enable[i]), 
				.clk(clk), .in(WriteData), .out(reg_out[i]));
		end
	endgenerate
	// hardwire 31 to 0
	assign reg_out[31] = 64'h00000000;
	// 1st read port
	mux32_1 readdata1_mux (.in(reg_out), .sel(ReadRegister1), 
		.out(ReadData1));
	// 2nd read port
	mux32_1 readdata2_mux (.in(reg_out), .sel(ReadRegister2), 
		.out(ReadData2));
endmodule