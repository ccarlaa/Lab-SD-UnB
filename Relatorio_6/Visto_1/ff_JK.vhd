library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is
    port(
        J, K, CLK, CLR, PR : in  std_logic;
        Q, Qbar        : out std_logic
    );
end jk_flipflop;

architecture behavior of jk_flipflop is
    signal temp_q : std_logic;
    signal aux: std_logic_vector(1 downto 0);

begin
    aux <= J & K;

    process(CLK, CLR, PR)
    begin
	if PR = '1' then
		temp_q <= '1';
        elsif CLR = '1' then
		temp_q <= '0';
	elsif PR = '1' then
		temp_q <= '1';
        elsif rising_edge(CLK) then
            if aux = "00" then
                temp_q <= temp_q;
            elsif aux = "01" then
                temp_q <= '0';
            elsif aux = "10" then
                temp_q <= '1';
            elsif aux = "11" then
                temp_q <= not temp_q;
            else
                temp_q <= temp_q;
            end if;
        end if;
    end process;

    Q <= temp_q;
    Qbar <= not temp_q;
end behavior;

