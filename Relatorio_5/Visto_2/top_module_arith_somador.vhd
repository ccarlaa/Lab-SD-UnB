library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module_arith is
    Port ( 
	   A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0)
);
end top_module_arith;

architecture Behavioral of top_module_arith is

Component somador_arith
    Port (
    	A, B: in STD_LOGIC_VECTOR(3 downto 0);
    	S:  out STD_LOGIC_VECTOR(4 downto 0)
);         
end Component;

signal U1,U2 :std_logic_vector(3 downto 0);   
signal U3 :std_logic_vector(4 downto 0);

begin   

U1 <= A;
U2 <= B;

sum: somador_arith port map (A => U1, B => U2, S => U3);

S <= U3;

end Behavioral;