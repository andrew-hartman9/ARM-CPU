library verilog;
use verilog.vl_types.all;
entity dec3_8 is
    port(
        \in\            : in     vl_logic_vector(2 downto 0);
        en              : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end dec3_8;
