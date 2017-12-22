library verilog;
use verilog.vl_types.all;
entity D_FF_EN is
    port(
        \in\            : in     vl_logic;
        en              : in     vl_logic;
        clk             : in     vl_logic;
        async           : in     vl_logic;
        \out\           : out    vl_logic
    );
end D_FF_EN;
