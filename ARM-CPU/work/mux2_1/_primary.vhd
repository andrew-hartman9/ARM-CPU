library verilog;
use verilog.vl_types.all;
entity mux2_1 is
    generic(
        WIDTH           : integer := 64
    );
    port(
        \in\            : in     vl_logic_vector(1 downto 0);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end mux2_1;
