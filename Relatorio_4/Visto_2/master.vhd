library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity master is
    Port ( 
	   SW: in STD_LOGIC_VECTOR (6 downto 0);
	   LD1: out STD_LOGIC
	);
end master;

architecture Behavioral of master is

component mux_8
    Port ( 
           S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC
	);
end component;

component dec_4_to_16
    Port (
        A : in  STD_LOGIC_VECTOR (3 downto 0);
        Y : out STD_LOGIC_VECTOR (15 downto 0)
	);
end component;

signal u0: STD_LOGIC_VECTOR(15 downto 0); --saida do dec
signal u1: STD_LOGIC_VECTOR(3 downto 0);  --entradas do dec
signal u2: STD_LOGIC_VECTOR(2 downto 0);  --chaves
signal u3: STD_LOGIC_VECTOR(7 downto 0);  --entradas do mux

begin

u1 <= SW(6 downto 3);

decoder: dec_4_to_16 port map(A => u1, Y => u0);

u2 <= SW(2 downto 0);

u3(0) <= "0";
u3(1) <= u0(0) or u0(15);
u3(2) <= u0(7);
u3(3) <= "1";
u3(4) <= u0(15) or u0(9);
u3(5) <= "0";
u3(6) <= u0(10) or u0(11); --don't care
u3(7) <= "1";

mux: mux_8 port map(S => u2, D => u3, Y  => LD1);

end Behavioral;