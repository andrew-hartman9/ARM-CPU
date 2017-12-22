library verilog;
use verilog.vl_types.all;
entity hazard_controller is
    port(
        store           : in     vl_logic;
        ReadRegister_MEM: in     vl_logic_vector(4 downto 0);
        ReadRegister2_in_UC: in     vl_logic_vector(4 downto 0);
        ReadRegister1_in: in     vl_logic_vector(4 downto 0);
        ReadRegister2_in: in     vl_logic_vector(4 downto 0);
        WriteRegister_EX: in     vl_logic_vector(4 downto 0);
        WriteRegister_MEM: in     vl_logic_vector(4 downto 0);
        WriteRegister_WB: in     vl_logic_vector(4 downto 0);
        ld_target       : in     vl_logic_vector(63 downto 0);
        st_target       : in     vl_logic_vector(63 downto 0);
        fwd_a_1_sel_out : out    vl_logic;
        fwd_a_2_sel_out : out    vl_logic;
        fwd_b_1_sel_out : out    vl_logic;
        fwd_b_2_sel_out : out    vl_logic;
        cbz_fwd         : out    vl_logic;
        st_fwd_sel      : out    vl_logic
    );
end hazard_controller;
