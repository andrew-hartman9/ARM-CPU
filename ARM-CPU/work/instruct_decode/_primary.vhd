library verilog;
use verilog.vl_types.all;
entity instruct_decode is
    port(
        not_clk         : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RegWrite_in     : in     vl_logic;
        negative        : in     vl_logic;
        zero            : in     vl_logic;
        overflow        : in     vl_logic;
        carry_out       : in     vl_logic;
        cbz_fwd         : in     vl_logic;
        WriteRegister_in: in     vl_logic_vector(4 downto 0);
        instruct_in     : in     vl_logic_vector(31 downto 0);
        alu_result_ID_in: in     vl_logic_vector(63 downto 0);
        WriteData_ID_in : in     vl_logic_vector(63 downto 0);
        addr_ID_in      : in     vl_logic_vector(63 downto 0);
        store           : out    vl_logic;
        write_enable_ID_out: out    vl_logic;
        RegWrite_ID_out : out    vl_logic;
        memtoreg_sel_ID_out: out    vl_logic;
        flush_out       : out    vl_logic;
        addr_sel_out    : out    vl_logic;
        cntrl_out       : out    vl_logic_vector(2 downto 0);
        ReadRegister1_out: out    vl_logic_vector(4 downto 0);
        ReadRegister2_out_UC: out    vl_logic_vector(4 downto 0);
        ReadRegister2_ID_out: out    vl_logic_vector(4 downto 0);
        WriteRegister_ID_out: out    vl_logic_vector(4 downto 0);
        ReadData1_out   : out    vl_logic_vector(63 downto 0);
        ReadData2_ID_out: out    vl_logic_vector(63 downto 0);
        alu_src_out     : out    vl_logic_vector(63 downto 0);
        addr_ID_out     : out    vl_logic_vector(63 downto 0)
    );
end instruct_decode;
