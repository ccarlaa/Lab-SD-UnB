library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8 is
    Port (
           S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC
    );
end mux_8;

architecture Behavioral of mux_8 is

signal entrada: STD_LOGIC_VECTOR(2 downto 0); 

begin

    entrada <= S(2) & S(1) & S(0);

	Y <= D(0) when (entrada = "000") else
             	 D(1) when (entrada = "001") else
            	 D(2) when (entrada = "010") else
            	 D(3) when (entrada = "011") else
            	 D(4) when (entrada = "100") else
            	 D(5) when (entrada = "101") else
            	 D(6) when (entrada = "110") else
          	 D(7);

end Behavioral;
