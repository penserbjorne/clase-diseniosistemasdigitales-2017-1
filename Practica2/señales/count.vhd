library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity count is
    port (
        clk: in std_logic;
        conta: buffer std_logic_vector(10 downto 0)
    );
end entity;

architecture arch of count is
    begin
        process (clk) begin
            if (clk'event and clk= '1') then
                conta <= conta + 1;
            end if;
        end process;
end architecture;
