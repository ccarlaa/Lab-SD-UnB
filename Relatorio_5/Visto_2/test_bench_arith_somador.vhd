library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity test_bench_arith is
end;

architecture behavior of test_bench_arith is

component somador_arith is port (
	   A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0)
);

end component;

signal Uaux : std_logic_vector (7 downto 0):= (others => '0');
signal U1 : std_logic_vector (3 downto 0) := (others => '0');
signal U2 : std_logic_vector (3 downto 0):= (others => '0');
signal U3 : std_logic_vector (4 downto 0):= (others => '0');

begin

U1 <= Uaux(3 downto 0);
U2 <= Uaux(7 downto 4);

somador:  somador_arith port map (A => U1, B => U2, S => U3);

estimulo: process

begin

for I in 0 to 255 loop
	wait for 20 ns; Uaux <= UNSIGNED (Uaux) +1;
end loop;
wait;
end process;

end behavior;