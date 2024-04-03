library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity master is
    Port ( 
        sw1 : in  STD_LOGIC_VECTOR(3 downto 0); 
        sw0 : in  STD_LOGIC_VECTOR(1 downto 0);
        led : out STD_LOGIC
    );
end master;

architecture Behavioral of master is

    signal U0 : STD_LOGIC_VECTOR(1 downto 0);
    signal U1 : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC;

    component mux is
        Port ( 
            S : in STD_LOGIC_VECTOR(1 downto 0);
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;
begin

    U0 <= sw0;
    U1 <= sw1;

    somador : mux
            port map (
                S => U0,
                D => U1,
                Y => Y
            );

    led <= Y;

end Behavioral;
