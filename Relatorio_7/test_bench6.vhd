
-- Recebe o refri depois de inserir 4 moedas de 25 centavos

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end entity;

architecture main of test_bench is
    component maquina is
        port (
            A: in std_logic_vector (1 downto 0); -- A[0] = B A[1] = B
            clock, rst: in std_logic;
            refri, devolve_50, devolve_25 : out std_logic
        );
    end component;

    signal u_A : std_logic_vector(1 downto 0) := "00";
    signal u_rst, u_clk, r, d_50, d_25: std_logic := '0';

begin
    tb_shift_register: maquina 
        port map(
            A => u_A,
            rst => u_rst,
            clock => u_clk,
            refri => r,
            devolve_50 => d_50,
            devolve_25 => d_25
        );


    process
    begin
        while True loop
            u_clk <= '0';
            wait for 1 ns;
            u_clk <= '1';
            wait for 1 ns;
        end loop;
    end process;

    process
    begin
        u_A <= "00" after 0 ns, 
              "01" after 2 ns,
	      "01" after 4 ns,
	      "01" after 6 ns,
	      "01" after 8 ns;
        wait;
    end process;

end architecture;