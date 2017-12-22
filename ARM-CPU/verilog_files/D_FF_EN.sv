// Andrew Hartman, EE 469, Lab 4
`timescale 1ps/1ps

// D_FF with enable, which can be asyncronous or not depending on the
// async signal
module D_FF_EN (input in, en, clk, async, output out);
	wire sync_in_val, sync_out, async_in_val, async_FF_out, 
	enabled_out;
	mux2_1 #(.WIDTH(1)) sync_in (.in({in, sync_out}), .sel(en), 
		.out(sync_in_val));
	D_FF sync_FF (.q(sync_out), .d(sync_in_val), 
		.reset(1'b0), .clk(clk));
	mux2_1 #(.WIDTH(1)) sync_out_mux (.in({in, async_FF_out}), 
		.sel(en), .out(async_in_val));
	D_FF async_FF (.q(async_FF_out), .d(async_in_val), 
		.reset(1'b0), .clk(clk));
	mux2_1 #(.WIDTH(1)) async_in (.in({in, async_FF_out}), .sel(en), 
		.out(enabled_out));
	mux2_1 #(.WIDTH(1)) async_mux (.in({enabled_out, sync_out}), 
		.sel(async), .out(out));
endmodule