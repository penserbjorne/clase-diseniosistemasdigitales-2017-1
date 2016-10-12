library ieee;
use ieee.std_logic_1164.all;

entity seno is
  port (
    clk: in std_logic;
    data: out std_logic_vector(11 downto 0)
  );
end entity;

architecture arch of seno is
    signal baddr: std_logic_vector(11 downto 0);
begin
    U1: entity work.count12 port map(
        clk => clk,
        conta => baddr
    );
    U2: entity work.rom port map(
        clk => clk,
        addr => baddr,
        data => data
    );
end architecture;
