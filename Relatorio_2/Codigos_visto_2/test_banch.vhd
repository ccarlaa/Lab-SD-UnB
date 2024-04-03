library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end test_bench;

architecture Behavioral of test_bench is
    signal U0 : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal U1 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Y : STD_LOGIC;

    component master is
        Port ( 
            sw0 : in  STD_LOGIC_VECTOR(1 downto 0);
            sw1 : in  STD_LOGIC_VECTOR(3 downto 0);
            led : out STD_LOGIC
        );
    end component;

begin

UUT: master port map (
    sw0 => U0,
    sw1 => U1,
    led => Y
);

-- Para gerar todas as 16 possivilidades de numeros com 4 bits
U1(0) <= not U1(0) after 2ns;
U1(1) <= not U1(1) after 4ns;
U1(2) <= not U1(2) after 8ns;
U1(3) <= not U1(3) after 16ns;


process
begin

    -- Para gerar todas as possibilidades de numeros com 2 bits
    U0 <= "00";
    wait for 32ns;
    U0 <= "01";
    wait for 32ns;
    U0 <= "10";
    wait for 32ns;
    U0 <= "11";
    wait for 32ns;
    
    wait;
end process;

end Behavioral;
