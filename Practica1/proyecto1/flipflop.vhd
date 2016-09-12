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

entity flipflop is
   port (
		clk: in std_logic;
        T, clr: in std_logic := '0';
		clk_enable: in std_logic := '1';
		Q: buffer std_logic := '0'
	);
end entity flipflop;

architecture archT of flipflop is
begin
    process (clr, clk)
    begin
        if (clk'event and clk = '1') then
            if clr = '1' then
                Q <= '0';
            elsif clk_enable ='1' then
                Q <= T xor Q;
            end if;
        end if;
    end process;
end archT;
