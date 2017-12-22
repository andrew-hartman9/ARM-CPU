library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        \_store\        : out    vl_logic;
        rt              : in     vl_logic_vector(63 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        negative        : in     vl_logic;
        zero            : in     vl_logic;
        overflow        : in     vl_logic;
        carry_out       : in     vl_logic;
        instruction     : in     vl_logic_vector(31 downto 0);
        ReadRegister1   : out    vl_logic_vector(4 downto 0);
        ReadRegister2   : out    vl_logic_vector(4 downto 0);
        WriteRegister   : out    vl_logic_vector(4 downto 0);
        RegWrite        : out    vl_logic;
        alu_imm_raw     : out    vl_logic_vector(11 downto 0);
        d_addr_raw      : out    vl_logic_vector(8 downto 0);
        alu_addr_sel    : out    vl_logic;
        alu_src_sel     : out    vl_logic;
        write_enable    : out    vl_logic;
        br_sel          : out    vl_logic;
        addr_sel        : out    vl_logic;
        cntrl           : out    vl_logic_vector(2 downto 0);
        cond_offset_raw : out    vl_logic_vector(18 downto 0);
        br_offset_raw   : out    vl_logic_vector(25 downto 0);
        memtoreg_sel    : out    vl_logic;
        special_addr_sel: out    vl_logic;
        flush           : out    vl_logic;
        alu_link_sel    : out    vl_logic
    );
end controller;
