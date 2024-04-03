library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_completo is
    Port (
	   A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end somador_completo;

architecture Behavioral of somador_completo is

begin

S <= A xnor B xnor Cin;

Cout <= (A and B) or (A and Cin) or (B and Cin);


end Behavioral;
