library ieee;
use ieee.std_logic_1164.all;

entity practica2_seniales is
  port (
    clk: in std_logic;
    sel: in std_logic_vector(2 downto 0);
    data: out std_logic_vector(11 downto 0)
  );
end entity;

architecture arch of practica2_seniales is
	signal baddr: std_logic_vector(10 downto 0);
	signal data1, data2, data3, data4, data5: std_logic_vector(11 downto 0);

begin
    U1: entity work.count port map(
        clk => clk,
        conta => baddr
    );
    U2: entity work.rom port map(
        clk => clk,
        addr => baddr,
        data => data1
    );
    U3: entity work.rom_triangle port map(
        clk => clk,
        addr => baddr,
        data => data2
    );
    U4: entity work.rom_sierra port map(
        clk => clk,
        addr => baddr,
        data => data3
    );
    U5: entity work.romcuadrada port map(
        clk => clk,
        addr => baddr,
        data => data4
    );
    U6: entity work.romvicflo port map(
        clk => clk,
        addr => baddr,
        data => data5
    );
    data <= data2 when sel = "001" else
            data3 when sel = "010" else
            data4 when sel = "011" else
            data5 when sel = "100" else
            data1;
end architecture;
