library verilog;
use verilog.vl_types.all;
entity execution is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RegWrite_EX_in  : in     vl_logic;
        write_enable_EX_in: in     vl_logic;
        fwd_a_1_sel_in  : in     vl_logic;
        fwd_a_2_sel_in  : in     vl_logic;
        fwd_b_1_sel_in  : in     vl_logic;
        fwd_b_2_sel_in  : in     vl_logic;
        memtoreg_sel_EX_in: in     vl_logic;
        cntrl_in        : in     vl_logic_vector(2 downto 0);
        WriteRegister_EX_in: in     vl_logic_vector(4 downto 0);
        ReadRegister2_EX_in: in     vl_logic_vector(4 downto 0);
        ReadData1_in    : in     vl_logic_vector(63 downto 0);
        ReadData2_EX_in : in     vl_logic_vector(63 downto 0);
        alu_src_in      : in     vl_logic_vector(63 downto 0);
        WriteData_EX_in : in     vl_logic_vector(63 downto 0);
        write_enable_EX_out: out    vl_logic;
        RegWrite_EX_out : out    vl_logic;
        negative        : out    vl_logic;
        zero            : out    vl_logic;
        overflow        : out    vl_logic;
        carry_out       : out    vl_logic;
        memtoreg_sel_EX_out: out    vl_logic;
        WriteRegister_EX_out: out    vl_logic_vector(4 downto 0);
        ReadRegister2_EX_out: out    vl_logic_vector(4 downto 0);
        ReadData2_EX_out: out    vl_logic_vector(63 downto 0);
        alu_result_EX_out: out    vl_logic_vector(63 downto 0)
    );
end execution;
