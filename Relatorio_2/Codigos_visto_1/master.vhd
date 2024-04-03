library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity master is
    Port ( 
        sw0 : in  STD_LOGIC;
        sw1 : in  STD_LOGIC;
        sw2 : in  STD_LOGIC;
        led : out STD_LOGIC;
        Cout: out STD_LOGIC
    );
end master;

architecture Behavioral of master is

    signal U0, U1, U2 : STD_LOGIC;
    signal S : STD_LOGIC;
    signal CarryOut : STD_LOGIC; 

    component somador_completo
    Port ( 
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
    end component;
begin

    U0 <= sw0;
    U1 <= sw1;
    U2 <= sw2; 

    somador : somador_completo
            port map (
                A => U0,
                B => U1,
                Cin => U2,
                S => S,
                Cout => CarryOut 
            );

    led <= S;
    Cout <= CarryOut;
end Behavioral;
