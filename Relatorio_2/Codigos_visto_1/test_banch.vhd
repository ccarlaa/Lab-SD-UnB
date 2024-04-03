library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Test_banch is
end Test_banch;

architecture Behavioral of Test_banch is
    signal U0, U1, U2 : STD_LOGIC;
    signal S, Cout : STD_LOGIC;

    component Master is
        Port ( 
            sw0 : in  STD_LOGIC;
            sw1 : in  STD_LOGIC;
            sw2 : in  STD_LOGIC;
            led : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

begin

UUT: Master port map (
    sw0 => U0,
    sw1 => U1,
    sw2 => U2,
    led => S,
    Cout => Cout
);

process
begin
    U0 <= '0'; U1 <= '0'; U2 <= '0';
    wait for 10ns;
    U0 <= '0'; U1 <= '0'; U2 <= '1';
    wait for 10ns;
    U0 <= '0'; U1 <= '1'; U2 <= '0';
    wait for 10ns;
    U0 <= '0'; U1 <= '1'; U2 <= '1';
    wait for 10ns;
    U0 <= '1'; U1 <= '0'; U2 <= '0';
    wait for 10ns;
    U0 <= '1'; U1 <= '0'; U2 <= '1';
    wait for 10ns;
    U0 <= '1'; U1 <= '1'; U2 <= '0';
    wait for 10ns;
    U0 <= '1'; U1 <= '1'; U2 <= '1';
    wait for 10ns;
    
 end process;

end Behavioral;
