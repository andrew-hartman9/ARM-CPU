library verilog;
use verilog.vl_types.all;
entity \register\ is
    port(
        write_enable    : in     vl_logic;
        clk             : in     vl_logic;
        \in\            : in     vl_logic_vector(63 downto 0);
        \out\           : out    vl_logic_vector(63 downto 0)
    );
end \register\;
