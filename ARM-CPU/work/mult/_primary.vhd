library verilog;
use verilog.vl_types.all;
entity mult is
    port(
        A               : in     vl_logic_vector(63 downto 0);
        B               : in     vl_logic_vector(63 downto 0);
        doSigned        : in     vl_logic;
        mult_low        : out    vl_logic_vector(63 downto 0);
        mult_high       : out    vl_logic_vector(63 downto 0)
    );
end mult;
