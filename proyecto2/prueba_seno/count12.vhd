library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity count12 is
    port (
        --      clk, load, reset, cp: in     std_logic;
        clk: in std_logic;
        --        data:                 in     std_logic_vector(9 downto 0);
        conta: buffer std_logic_vector(11 downto 0)
    );
end entity;

architecture arch of count12 is
    begin
        --process (clk,reset)
        process (clk)
        begin
            --if reset = '1' then
            --    conta <= "0000";
            --elsif (clk'event and clk= '1') then
            if (clk'event and clk= '1') then
                --if load = '1' then
                --    conta <= data;
                --elsif cp = '1' then
                conta <= conta + 1;
                --else conta <= conta - 1;
                --end if;
            end if;
        end process;


    end architecture;
