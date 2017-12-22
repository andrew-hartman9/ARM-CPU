library verilog;
use verilog.vl_types.all;
entity dec5_32 is
    port(
        \in\            : in     vl_logic_vector(4 downto 0);
        en              : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end dec5_32;
