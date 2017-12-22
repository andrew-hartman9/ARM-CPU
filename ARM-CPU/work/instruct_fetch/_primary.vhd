library verilog;
use verilog.vl_types.all;
entity instruct_fetch is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        addr_sel_in     : in     vl_logic;
        flush           : in     vl_logic;
        addr_IF_in      : in     vl_logic_vector(63 downto 0);
        instruct_out    : out    vl_logic_vector(31 downto 0);
        addr_IF_out     : out    vl_logic_vector(63 downto 0)
    );
end instruct_fetch;
