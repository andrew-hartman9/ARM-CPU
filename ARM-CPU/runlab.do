# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./adder.sv"
vlog "./adder_slice.sv"
vlog "./all_zero.sv"
vlog "./alu.sv"
vlog "./alu_slice.sv"
vlog "./controller.sv"
vlog "./D_FF.sv"
vlog "./D_FF_EN.sv"
vlog "./datamem.sv"
vlog "./dec2_4.sv"
vlog "./dec3_8.sv"
vlog "./dec5_32.sv"
vlog "./execution.sv"
vlog "./hazard_controller.sv"
vlog "./instruct_decode.sv"
vlog "./instruct_fetch.sv"
vlog "./instructmem.sv"
vlog "./math.sv"
vlog "./memory.sv"
vlog "./mux2_1.sv"
vlog "./mux8_1.sv"
vlog "./mux32_1.sv"
vlog "./program_counter.sv"
vlog "./regfile.sv"
vlog "./register.sv"
vlog "./sign_extender.sv"
vlog "./top.sv"
vlog "./write_back.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work top_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do top_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
