
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end test_bench;

architecture Behavioral of test_bench is
    signal A : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Y : STD_LOGIC_VECTOR(7 downto 0);

    component master is
        Port (
            SW : in  STD_LOGIC_VECTOR (3 downto 0);
            LED : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

begin

    UUT: master port map (SW => A, LED=>Y);

A(0) <= not A(0) after 2ns;
A(1) <= not A(1) after 4ns;
A(2) <= not A(2) after 8ns;
A(3) <= not A(3) after 16ns;

end Behavioral;
