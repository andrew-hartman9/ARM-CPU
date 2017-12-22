onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_testbench/dut/clk
add wave -noupdate /top_testbench/dut/reset
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/store
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/ReadRegister_MEM
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/ReadRegister2_in_UC
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/ReadRegister1_in
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/ReadRegister2_in
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/WriteRegister_EX
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/WriteRegister_MEM
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/WriteRegister_WB
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/ld_target
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/st_target
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/fwd_a_1_sel_out
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/fwd_a_2_sel_out
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/fwd_b_1_sel_out
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/fwd_b_2_sel_out
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/cbz_fwd
add wave -noupdate -group HC /top_testbench/dut/hazard_controller/st_fwd_sel
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/clk
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/reset
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/addr_sel_in
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/flush
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/addr_IF_in
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/instruct_out
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/addr_IF_out
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/addr
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/next_addr
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/inc_addr
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/instruct
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/instruct_temp
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/not_flush
add wave -noupdate -group IF /top_testbench/dut/instruct_fetch/next_flush
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/not_clk
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/clk
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/reset
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/RegWrite_in
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/negative
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/zero
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/overflow
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/carry_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/cbz_fwd
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/WriteRegister_in
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/instruct_in
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_result_ID_in
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/WriteData_ID_in
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/addr_ID_in
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/store
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/write_enable_ID_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/RegWrite_ID_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/memtoreg_sel_ID_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/flush_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/addr_sel_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/cntrl_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadRegister1_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadRegister2_out_UC
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadRegister2_ID_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/WriteRegister_ID_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadData1_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadData2_ID_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_src_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/addr_ID_out
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/flush
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/RegWrite
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/write_enable
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/br_sel
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/memtoreg_sel
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_addr_sel
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_src_sel
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/special_addr_sel
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_link_sel
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/addr_sel
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/cntrl
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadRegister1
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadRegister2
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadRegister1_out_temp
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadRegister2_out_temp
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/WriteRegister
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/d_addr_raw
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_imm_raw
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/cond_offset_raw
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/br_offset_raw
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadData1
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/ReadData2
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_imm_E
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/d_addr_E
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_addr
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_src
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/br_addr
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/br_offset_S
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/br_offset_US
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/cond_offset_EX
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/br_offset_EX
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/alu_link
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/special_addr
add wave -noupdate -group ID /top_testbench/dut/instruct_decode/cbzfwd_out
add wave -noupdate -group EX /top_testbench/dut/execution/clk
add wave -noupdate -group EX /top_testbench/dut/execution/reset
add wave -noupdate -group EX /top_testbench/dut/execution/RegWrite_EX_in
add wave -noupdate -group EX /top_testbench/dut/execution/write_enable_EX_in
add wave -noupdate -group EX /top_testbench/dut/execution/fwd_a_1_sel_in
add wave -noupdate -group EX /top_testbench/dut/execution/fwd_a_2_sel_in
add wave -noupdate -group EX /top_testbench/dut/execution/fwd_b_1_sel_in
add wave -noupdate -group EX /top_testbench/dut/execution/fwd_b_2_sel_in
add wave -noupdate -group EX /top_testbench/dut/execution/memtoreg_sel_EX_in
add wave -noupdate -group EX /top_testbench/dut/execution/cntrl_in
add wave -noupdate -group EX /top_testbench/dut/execution/WriteRegister_EX_in
add wave -noupdate -group EX /top_testbench/dut/execution/ReadRegister2_EX_in
add wave -noupdate -group EX /top_testbench/dut/execution/ReadData1_in
add wave -noupdate -group EX /top_testbench/dut/execution/ReadData2_EX_in
add wave -noupdate -group EX /top_testbench/dut/execution/alu_src_in
add wave -noupdate -group EX /top_testbench/dut/execution/WriteData_EX_in
add wave -noupdate -group EX /top_testbench/dut/execution/write_enable_EX_out
add wave -noupdate -group EX /top_testbench/dut/execution/RegWrite_EX_out
add wave -noupdate -group EX /top_testbench/dut/execution/negative
add wave -noupdate -group EX /top_testbench/dut/execution/zero
add wave -noupdate -group EX /top_testbench/dut/execution/overflow
add wave -noupdate -group EX /top_testbench/dut/execution/carry_out
add wave -noupdate -group EX /top_testbench/dut/execution/memtoreg_sel_EX_out
add wave -noupdate -group EX /top_testbench/dut/execution/WriteRegister_EX_out
add wave -noupdate -group EX /top_testbench/dut/execution/ReadRegister2_EX_out
add wave -noupdate -group EX /top_testbench/dut/execution/ReadData2_EX_out
add wave -noupdate -group EX /top_testbench/dut/execution/alu_result_EX_out
add wave -noupdate -group EX /top_testbench/dut/execution/fwd_a_1
add wave -noupdate -group EX /top_testbench/dut/execution/fwd_b_1
add wave -noupdate -group EX /top_testbench/dut/execution/fwd_a_2
add wave -noupdate -group EX /top_testbench/dut/execution/fwd_b_2
add wave -noupdate -group EX /top_testbench/dut/execution/alu_result
add wave -noupdate -group MEM /top_testbench/dut/memory/clk
add wave -noupdate -group MEM /top_testbench/dut/memory/reset
add wave -noupdate -group MEM /top_testbench/dut/memory/write_enable_MEM_in
add wave -noupdate -group MEM /top_testbench/dut/memory/RegWrite_MEM_in
add wave -noupdate -group MEM /top_testbench/dut/memory/memtoreg_sel_MEM_in
add wave -noupdate -group MEM /top_testbench/dut/memory/st_fwd_sel
add wave -noupdate -group MEM /top_testbench/dut/memory/WriteRegister_MEM_in
add wave -noupdate -group MEM /top_testbench/dut/memory/ReadData2_MEM_in
add wave -noupdate -group MEM /top_testbench/dut/memory/alu_result_MEM_in
add wave -noupdate -group MEM /top_testbench/dut/memory/RegWrite_MEM_out
add wave -noupdate -group MEM /top_testbench/dut/memory/memtoreg_sel_MEM_out
add wave -noupdate -group MEM /top_testbench/dut/memory/WriteRegister_MEM_out
add wave -noupdate -group MEM /top_testbench/dut/memory/alu_result_MEM_out
add wave -noupdate -group MEM /top_testbench/dut/memory/mem_result_out
add wave -noupdate -group MEM /top_testbench/dut/memory/mem_result
add wave -noupdate -group MEM /top_testbench/dut/memory/ReadData2_MEM_out
add wave -noupdate -group MEM /top_testbench/dut/memory/write_data
add wave -noupdate -group WB /top_testbench/dut/write_back/clk
add wave -noupdate -group WB /top_testbench/dut/write_back/reset
add wave -noupdate -group WB /top_testbench/dut/write_back/memtoreg_sel_WB_in
add wave -noupdate -group WB /top_testbench/dut/write_back/mem_result_in
add wave -noupdate -group WB /top_testbench/dut/write_back/alu_result_WB_in
add wave -noupdate -group WB /top_testbench/dut/write_back/WriteData_out
add wave -noupdate -group WB /top_testbench/dut/write_back/memtoreg
add wave -noupdate -radix decimal -childformat {{{/top_testbench/dut/instruct_decode/regfile/reg_out[31]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[30]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[29]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[28]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[27]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[26]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[25]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[24]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[23]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[22]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[21]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[20]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[19]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[18]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[17]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[16]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[15]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[14]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[13]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[12]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[11]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[10]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[9]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[8]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[7]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[6]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[5]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[4]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[3]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[2]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[1]} -radix decimal} {{/top_testbench/dut/instruct_decode/regfile/reg_out[0]} -radix decimal}} -expand -subitemconfig {{/top_testbench/dut/instruct_decode/regfile/reg_out[31]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[30]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[29]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[28]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[27]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[26]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[25]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[24]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[23]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[22]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[21]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[20]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[19]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[18]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[17]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[16]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[15]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[14]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[13]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[12]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[11]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[10]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[9]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[8]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[7]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[6]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[5]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[4]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[3]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[2]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[1]} {-radix decimal} {/top_testbench/dut/instruct_decode/regfile/reg_out[0]} {-radix decimal}} /top_testbench/dut/instruct_decode/regfile/reg_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5401162 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 111
configure wave -valuecolwidth 212
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1052232 ps} {1361723 ps}
