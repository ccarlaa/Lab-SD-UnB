library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_bench_golden is
end test_bench_golden;

architecture behavior of test_bench_golden is
    component top_module is
        port (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            S : out STD_LOGIC_VECTOR (4 downto 0);
            Cout0: out STD_LOGIC;
            Cout1: out STD_LOGIC;
            Cout2: out STD_LOGIC;
            Cout3: out STD_LOGIC
        );
    end component;

    component top_module_arith is 
        port (
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0)
        );
    end component;

    signal U1: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal U2: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal C0, C1, C2, C3: STD_LOGIC;
    signal f_dut, f_gm: STD_LOGIC_VECTOR(4 downto 0);

begin
    somador_test: top_module port map (
        A => U1,
        B => U2,
        S => f_dut,
        Cout0 => C0,
        Cout1 => C1,
        Cout2 => C2,
        Cout3 => C3
    );

    somador_golden: top_module_arith port map (
        A => U1,
        B => U2,
        S => f_gm
    );

    estimulo: process
        variable cont : STD_LOGIC_VECTOR(7 downto 0);
    begin
        cont  := "00000000";
        report "iniciando" severity NOTE;
        for i in 0 to 255 loop
            U1(0) <= cont(0);
            U1(1) <= cont(1);
            U1(2) <= cont(2);
            U1(3) <= cont(3);
            
            U2(0) <= cont(4);
            U2(1) <= cont(5);
            U2(2) <= cont(6);
            U2(3) <= cont(7);

            wait for 500 ns;

            assert(f_gm = f_dut) report "Falhou: i = " & integer'image(i) severity ERROR;

            cont := cont + 1;
        end loop;
        report "Teste finalizado" severity NOTE;
        wait;
    end process;
end behavior;

