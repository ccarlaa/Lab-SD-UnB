library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( 
	   A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0);
	   Cout0: out STD_LOGIC;
   	   Cout1: out STD_LOGIC;
   	   Cout2: out STD_LOGIC;
	   Cout3: out STD_LOGIC
);
end top_module;

architecture Behavioral of top_module is

Component somador_completo
    Port (
	   A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC
);         
end Component;

signal c0,c1,c2 :std_logic := '0';
signal U1,U2 :std_logic_vector(3 downto 0);   
signal U3 :std_logic_vector(4 downto 0);   

begin   

U1 <= A;
U2 <= B;

sum1: somador_completo port map (A=> U1(0), B=> U2(0), Cin=> '0', S=>U3(0), Cout=>c0);
Cout0 <= c0;
sum2: somador_completo port map (A=> U1(1), B=> U2(1), Cin=> c0, S=>U3(1), Cout=>c1);
Cout1 <= c1;
sum3: somador_completo port map (A=> U1(2), B=> U2(2), Cin=> c1, S=>U3(2), Cout=>c2);
Cout2 <= c2;
sum4: somador_completo port map (A=> U1(3), B=> U2(3), Cin=> c2, S=>U3(3), Cout=>U3(4)); 

S <= U3;
Cout3 <= U3(4);

end Behavioral;