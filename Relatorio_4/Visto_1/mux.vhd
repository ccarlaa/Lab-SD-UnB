library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( 
           S : in STD_LOGIC_VECTOR (1 downto 0); -- vetor de 2 bits (entrada)
           D : in STD_LOGIC_VECTOR (3 downto 0); -- vetor de 4 bits (entrada)
           Y : out STD_LOGIC  -- (saida)
    );
end mux;

architecture Behavioral of mux is

begin

-- Y = D0.S1'.S2' + D1.S1'.S0 + D2.S1.S0' + D3.S1.S2
Y <= (D(0) and not S(1) and not S(0))  or (D(1) and not S(1) and S(0)) or (D(2) and S(1) and not S(0)) or (D(3) and S(1) and S(0));

end Behavioral;
