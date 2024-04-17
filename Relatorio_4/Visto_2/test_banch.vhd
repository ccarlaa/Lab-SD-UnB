
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end test_bench;

architecture Behavioral of test_bench is
    signal U0 : STD_LOGIC_VECTOR(6 downto 0) := "0000000";
    signal S : STD_LOGIC;

    component master is
    	Port ( 
	   SW: in STD_LOGIC_VECTOR (6 downto 0);
	   LD1: out STD_LOGIC
	);
    end component;

begin

UUT: master port map (
    SW => U0,
    LD1 => S
);

U0(0) <= not U0(0) after 2ns;
U0(1) <= not U0(1) after 4ns;
U0(2) <= not U0(2) after 8ns;
U0(3) <= not U0(3) after 16ns;
U0(4) <= not U0(4) after 32ns;
U0(5) <= not U0(5) after 64ns;
U0(6) <= not U0(6) after 128ns;

end Behavioral;