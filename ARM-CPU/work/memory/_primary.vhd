library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        write_enable_MEM_in: in     vl_logic;
        RegWrite_MEM_in : in     vl_logic;
        memtoreg_sel_MEM_in: in     vl_logic;
        st_fwd_sel      : in     vl_logic;
        WriteRegister_MEM_in: in     vl_logic_vector(4 downto 0);
        ReadData2_MEM_in: in     vl_logic_vector(63 downto 0);
        alu_result_MEM_in: in     vl_logic_vector(63 downto 0);
        RegWrite_MEM_out: out    vl_logic;
        memtoreg_sel_MEM_out: out    vl_logic;
        WriteRegister_MEM_out: out    vl_logic_vector(4 downto 0);
        alu_result_MEM_out: out    vl_logic_vector(63 downto 0);
        mem_result_out  : out    vl_logic_vector(63 downto 0)
    );
end memory;
