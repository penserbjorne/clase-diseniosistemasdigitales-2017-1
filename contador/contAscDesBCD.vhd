-- Copyright (c) 2016 Emilio Cabrera <emilio1625@gmail.com>
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
		  led: buffer std_logic_vector(3 downto 0);
        data: in std_logic_vector(3 downto 0) := "0000";
        seg: out std_logic_vector(6 downto 0)
    );
end entity contAscDesBCD;

architecture archContAscDesBCD of contAscDesBCD is
signal cableClk: std_logic;
    begin
        Timer: entity work.tock
		      port map(
				    clk => clk,
					 clk_out => cableClk
				);
		  Conta: entity work.contadorBCD
		      port map(
				     clk => cableClk,
					  load => load,
					  data => data,
					  up => up,
                 clr => not clr,
                 Q => led
				);
        Deco: entity work.bcd7seg
		      port map(
				    bcd => led,
					 led => seg
				);
end architecture archContAscDesBCD;
