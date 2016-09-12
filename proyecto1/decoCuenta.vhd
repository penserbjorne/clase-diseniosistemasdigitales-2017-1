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

entity decoCuenta is
   port (
      bcd: in std_logic_vector(3 downto 0);
      led: out std_logic_vector(6 downto 0)
   );
end entity decoCuenta;

architecture arqDecoCuenta of DecoCuenta is
   begin
      with bcd select
         led <= "0000110" when "0000",
                "1001111" when "0001",
                "0010010" when "0010",
                "0000110" when "0011",
                "0000110" when "0100",
                "0000110" when "0101",
                "0010010" when "0110",
                "0100000" when "0111",
                "1001111" when "1000",
                "1111111" when others;
end architecture arqDecoCuenta;
