library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end test_bench;

architecture Behavioral of test_bench is
    signal A : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal LED_X : STD_LOGIC;
    signal LED_Y : STD_LOGIC;

    component master is
        Port (
	   SW: in STD_LOGIC_VECTOR (2 downto 0);
	   LD1: out STD_LOGIC;
 	   LD2: out STD_LOGIC
        );
    end component;

begin

    UUT: master port map (SW => A, LD1 => LED_X, LD2 => LED_Y);

A(0) <= not A(0) after 2ns;
A(1) <= not A(1) after 4ns;
A(2) <= not A(2) after 8ns;

end Behavioral;