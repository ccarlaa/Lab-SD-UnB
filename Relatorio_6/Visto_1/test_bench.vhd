library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end test_bench;

architecture main of test_bench is

component jk_flipflop is
	port(
		J, K, CLK, CLR, PR : in std_logic;
   		Q, QBar            : out std_logic
        );
end component;

signal u_j, u_k, u_clk, u_clr, u_pr, u_q, u_qbar : std_logic := '0';

begin

    test_bench_ff_JK : jk_flipflop port map(
	CLK => u_clk, 
	CLR => u_clr, 
	J => u_j, 
	K => u_k,
	PR => u_pr, 
	Q => u_q,
	QBar => u_qbar
    );

    u_clk <= not u_clk after 1 ns;
    u_clr <= not u_clr after 2 ns;
    u_j <= not u_j after 4 ns;
    u_k <= not u_k after 8 ns;
    u_pr <= not u_pr after 16 ns;
end main;