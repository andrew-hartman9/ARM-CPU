library verilog;
use verilog.vl_types.all;
entity alu_slice is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c_in            : in     vl_logic;
        b_inv           : in     vl_logic;
        sel             : in     vl_logic_vector(2 downto 0);
        c_out           : out    vl_logic;
        result          : out    vl_logic
    );
end alu_slice;
