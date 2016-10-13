library ieee;
use ieee.std_logic_1164.all;

entity rgbmatrix is
  port (
    clock:  in  std_logic;
    matrixR: out std_logic(7 downto 0);
    matrixG: out std_logic(7 downto 0);
    matrixB: out std_logic(7 downto 0);
    matrixC: out std_logic(7 downto 0);
  );
end entity;

architecture arch of rgbmatrix is

signal ticktock: std_logic;
signal decobus, rombus: std_logic_vector(7 downto 0);
signal addrbus: std_logic_vector();

begin
    U1: entity work.reloj port map(
        clock => clock,
        lento => ticktock
    );
    U2: entity work.controm port map(
        clk => ticktock,
        conta => addrbus
    );
end architecture;
