library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity somador_arith is
    port (
        A, B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(4 downto 0)
    );
end somador_arith;

architecture main of somador_arith is
begin
    S <= unsigned('0' & A) + unsigned('0' & B);
end main;
