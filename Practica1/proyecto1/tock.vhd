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
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity tock is
    port (
        clk, clr: in  std_logic;
        clk_out: buffer std_logic := '0'
    );
end tock;

architecture tick of tock is
    signal counter : integer range 0 to 24999999;
begin
    process (clk, clr)
        begin
            if (clk'event and clk = '1') then
				    if (clr = '1') then
					     counter <= 0;
						  clk_out <= '0';
					 end if;
                counter <= counter + 1;
                if (counter = 24999999) then
                    counter <= 0;
                    clk_out <= NOT(clk_out);
                end if;
             end if;
    end process;
end tick;
