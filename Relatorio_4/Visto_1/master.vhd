library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity master is
    Port ( 
	   SW: in STD_LOGIC_VECTOR (2 downto 0);
	   LD1: out STD_LOGIC;
 	   LD2: out STD_LOGIC
	);
end master;

architecture Behavioral of master is

component mux
    Port ( 
           S : in STD_LOGIC_VECTOR (1 downto 0); -- vetor de 2 bits (entrada)
           D : in STD_LOGIC_VECTOR (3 downto 0); -- vetor de 4 bits (entrada)
           Y : out STD_LOGIC  -- (saida)
	);
end component;

signal u0: STD_LOGIC_VECTOR(3 downto 0); --entradas_x
signal u1: STD_LOGIC_VECTOR(3 downto 0); --entradas_y
signal u2: STD_LOGIC_VECTOR(1 downto 0);  --chaves

begin

u2 <= SW(2 downto 1);
u0 <= "1" & not SW(0) & SW(0) & "0";
u1 <= SW(0) & "0" & not SW(0) & "1";

mux_x: mux port map(S => u2, D => u0, Y  => LD1);
mux_y: mux port map(S => u2, D => u1, Y  => LD2);

end Behavioral;