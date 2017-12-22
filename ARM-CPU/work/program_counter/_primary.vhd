library verilog;
use verilog.vl_types.all;
entity program_counter is
    port(
        address         : out    vl_logic_vector(63 downto 0);
        \next\          : in     vl_logic_vector(63 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end program_counter;
