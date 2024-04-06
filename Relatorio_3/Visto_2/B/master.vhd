
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Master is
    Port ( 
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           LED: out STD_LOGIC_VECTOR(7 downto 0)
	);
end Master;

architecture Behavioral of Master is

signal u1: STD_LOGIC_VECTOR(3 downto 0);
signal u0: STD_LOGIC_VECTOR(15 downto 0);

component dec_4_to_16
    Port (
        A : in  STD_LOGIC_VECTOR (3 downto 0);
        Y : out STD_LOGIC_VECTOR (15 downto 0)
	);
end component;

begin

u1 <= SW;
               
decodificador: dec_4_to_16 port map(A => u1, Y => u0);

LED <= u0(7 downto 0);

end Behavioral;