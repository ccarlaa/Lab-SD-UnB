library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end;

architecture main of test_bench is
    component shift_register is
        port( 
            DIR, L, R, RST, LOAD, CLK: in  std_logic;
            Q: out std_logic_vector(3 downto 0)
        );
    end component;
    signal u_dir : std_logic := '1';
    signal u_l, u_r, u_rst, u_load, u_clk: std_logic := '0';
    signal u_q : std_logic_vector(3 downto 0);

begin
    tb_shift_register : shift_register port map( 
        DIR => u_dir, 
        L => u_l, 
        R => u_r, 
        RST => u_rst,
        LOAD => u_load,
        CLK => u_clk,
        Q => u_q
    );

    u_clk <= not u_clk after 1 ns;
    u_l <= not u_l after 2 ns;
    u_r <= not u_r after  2 ns;
    u_dir <= not u_dir after 64 ns;
    u_load <= not u_load after 32 ns;
    u_rst <= not u_rst after 128 ns;

end main;
