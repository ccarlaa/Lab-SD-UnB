
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Master is
    Port ( 
	   SW: in STD_LOGIC_VECTOR (7 downto 0);
           BTN: in STD_LOGIC_VECTOR (2 downto 0);
	   LD: out STD_LOGIC
	);
end Master;

architecture Behavioral of Master is

signal u0: STD_LOGIC_VECTOR(2 downto 0);
signal u1: STD_LOGIC_VECTOR(7 downto 0);
signal u2: STD_LOGIC;

component mux_8
    Port ( 
           S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC
	);
end component;

begin

u0 <= BTN;
u1 <= SW;

mux8: mux_8 port map(S=> u0, D => u1, Y => u2);

LD <= u2;

end Behavioral;