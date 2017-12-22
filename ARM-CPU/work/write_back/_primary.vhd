library verilog;
use verilog.vl_types.all;
entity write_back is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        memtoreg_sel_WB_in: in     vl_logic;
        mem_result_in   : in     vl_logic_vector(63 downto 0);
        alu_result_WB_in: in     vl_logic_vector(63 downto 0);
        WriteData_out   : out    vl_logic_vector(63 downto 0)
    );
end write_back;
