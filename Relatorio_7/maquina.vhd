library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquina is
    port (
        A: in std_logic_vector(1 downto 0); -- A[0] = B, A[1] = A
        clock, rst: in std_logic;
        refri, devolve_50, devolve_25: out std_logic
    );
end maquina;

architecture main of maquina is
    type state_type is (INIT, INSERIU_25, INSERIU_50, INSERIU_75, LIBERA_REFRI, REFRI_25, CANCELA_25, CANCELA_50, CANCELA_75);
    signal current_state, next_state: state_type;
begin
    sync_proc: process(clock, rst)
    begin
	if(rst = '1') then 
		current_state <= INIT;
        elsif rising_edge(clock) then
            current_state <= next_state;
        end if;
    end process sync_proc;

    combinacao: process(current_state, A)
    begin
        case current_state is
            when INIT =>
                refri <= '0';
                devolve_50 <= '0';
                devolve_25 <= '0';
                if (A = "00" or A = "11") then
                    next_state <= INIT;
                elsif (A = "01") then
                    next_state <= INSERIU_25;
                elsif (A = "10") then
                    next_state <= INSERIU_50;
                end if;

            when INSERIU_25 =>
                refri <= '0';
                devolve_50 <= '0';
                devolve_25 <= '0';
                if (A = "00") then
                    next_state <= INSERIU_25;
                elsif (A = "01") then
                    next_state <= INSERIU_50;
                elsif (A = "10") then
                    next_state <= INSERIU_75;
                elsif (A = "11") then
                    next_state <= CANCELA_25;
                end if;

            when INSERIU_50 =>
                refri <= '0';
                devolve_50 <= '0';
                devolve_25 <= '0';
                if (A = "00") then
                    next_state <= INSERIU_50;
                elsif (A = "01") then
                    next_state <= INSERIU_75;
                elsif (A = "10") then
                    next_state <= LIBERA_REFRI;
                elsif (A = "11") then
                    next_state <= CANCELA_50;
                end if;

            when INSERIU_75 =>
                refri <= '0';
                devolve_50 <= '0';
                devolve_25 <= '0';
                if (A = "00") then
                    next_state <= INSERIU_75;
                elsif (A = "01") then
                    next_state <= LIBERA_REFRI;
                elsif (A = "10") then
                    next_state <= REFRI_25;
                elsif (A = "11") then
                    next_state <= CANCELA_75;
                end if;

            when LIBERA_REFRI =>
                refri <= '1';
                devolve_50 <= '0';
                devolve_25 <= '0';
                next_state <= INIT;

            when REFRI_25 =>
                refri <= '1';
                devolve_50 <= '0';
                devolve_25 <= '1';
                next_state <= INIT;

            when CANCELA_25 =>
                refri <= '0';
                devolve_50 <= '0';
                devolve_25 <= '1';
                next_state <= INIT;

            when CANCELA_50 =>
                refri <= '0';
                devolve_50 <= '1';
                devolve_25 <= '0';
                next_state <= INIT;

            when CANCELA_75 =>
                refri <= '0';
                devolve_50 <= '1';
                devolve_25 <= '1';
                next_state <= INIT;

            when others =>
                refri <= '0';
                devolve_50 <= '0';
                devolve_25 <= '0';
                next_state <= INIT;
        end case;
    end process combinacao;
end main;
