
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end test_bench;

architecture Behavioral of test_bench is
    signal U0 : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal U1 : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Y : STD_LOGIC;

    component master is
        Port ( 
	   SW: in STD_LOGIC_VECTOR (7 downto 0);
           BTN: in STD_LOGIC_VECTOR (2 downto 0);
	   LD: out STD_LOGIC
        );
    end component;

begin

UUT: master port map (
    SW => U0,
    BTN => U1,
    LD => Y
);

U0(0) <= not U0(0) after 2ns;
U0(1) <= not U0(1) after 4ns;
U0(2) <= not U0(2) after 8ns;
U0(3) <= not U0(3) after 16ns;
U0(4) <= not U0(4) after 32ns;
U0(5) <= not U0(5) after 64ns;
U0(6) <= not U0(6) after 128ns;
U0(7) <= not U0(7) after 256ns;

U1(0) <= not U1(0) after 512ns;
U1(1) <= not U1(1) after 1024ns;
U1(2) <= not U1(2) after 2048ns;

end Behavioral;