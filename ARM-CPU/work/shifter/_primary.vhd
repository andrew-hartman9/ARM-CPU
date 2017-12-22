library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        value           : in     vl_logic_vector(63 downto 0);
        direction       : in     vl_logic;
        distance        : in     vl_logic_vector(5 downto 0);
        result          : out    vl_logic_vector(63 downto 0)
    );
end shifter;
