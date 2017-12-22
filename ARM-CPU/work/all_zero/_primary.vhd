library verilog;
use verilog.vl_types.all;
entity all_zero is
    port(
        \in\            : in     vl_logic_vector(63 downto 0);
        zero            : out    vl_logic
    );
end all_zero;
