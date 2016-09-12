-- Copyright (c) 2016
-- Emilio Cabrera <emilio1625@gmail.com>
-- Sebastian Aguilar <penserbjorne>
--
-- GNU GENERAL PUBLIC LICENSE
--    Version 3, 29 June 2007
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contAscDesBCD is
    port(
        clk: in std_logic;
        load, clr, up: in std_logic := '0';
        data: in std_logic_vector(3 downto 0) := "0000";
        Q: buffer std_logic_vector(3 downto 0)
    );
end entity contAscDesBCD;

architecture archContAscDesBCD of contAscDesBCD is
    begin
        process(clk, clr)
        begin
            if (clk'event and clk = '1') then
                if clr = '1' then
                    Q <= "0000";
                elsif load = '1' then
                    Q <= data;
                elsif up = '1' then
                    if Q = "1001" then
                        Q <= "0000";
                    else
                        Q <= Q + 1;
                    end if;
                else
                    if Q = "0000" then
                        Q <= "1001";
                    else
                        Q <= Q - 1;
                    end if;
                end if;
            end if;
        end process;
end architecture archContAscDesBCD;
