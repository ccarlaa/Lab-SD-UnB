library Ieee;
use Ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use Ieee.std_logic_unsigned.all;

entity test_bench is
end;

architecture behavior of test_bench is

component top_module is port (
	   A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0);
	   Cout0: out STD_LOGIC;
   	   Cout1: out STD_LOGIC;
   	   Cout2: out STD_LOGIC;
	   Cout3: out STD_LOGIC
);

end component;

signal Uaux : std_logic_vector (7 downto 0):= (others => '0');
signal U1 : std_logic_vector (3 downto 0) := (others => '0');
signal U2 : std_logic_vector (3 downto 0):= (others => '0');
signal U3 : std_logic_vector (4 downto 0):= (others => '0');
signal C0, C1, C2, C3 : std_logic;

begin

U1 <= Uaux(3 downto 0);
U2 <= Uaux(7 downto 4);

somador:  top_module port map (
	A => U1,
	B => U2, S => U3 , 
	Cout0 => C0, 
	Cout1 => C1, 
	Cout2 => C2, 
	Cout3 => C3 
);

estimulo: process

begin

for I in 0 to 255 loop
	wait for 500 ns; Uaux <= UNSIGNED (Uaux) +1;
end loop;
wait;
end process;

end behavior;