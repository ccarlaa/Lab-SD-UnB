library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity shift_register is
	port( 
		DIR, L, R, RST, LOAD, CLK: in  std_logic;
		Q: out std_logic_vector(3 downto 0));
	end shift_register;

architecture main of shift_register is
	signal temp_q : std_logic_vector(3 downto 0);
begin
	process (CLK)
		begin
			if rising_edge(CLK) then	
				if RST = '1' then temp_q <= "0000";
      				elsif LOAD = '1' then temp_q <= temp_q;
				elsif DIR = '0' then temp_q <= temp_q(2) & temp_q(1) & temp_q(0) & L;
				elsif DIR = '1' then temp_q <= L & temp_q(3) & temp_q(2) & temp_q(1);
				end if;
			else temp_q <= temp_q;
			end if;
	end process;
	Q <= temp_q;
end main;
