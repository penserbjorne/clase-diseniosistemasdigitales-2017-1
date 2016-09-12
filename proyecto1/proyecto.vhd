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

entity proyecto is
    port (
      clk: in std_logic; -- entrada del reloj, pin 17
      clr: in std_logic := '1'; -- boton de reset, logica negada, pin 144
      seg: out std_logic_vector(6 downto 0); -- salida a display de 7 segmentos, pines 63,64,66,67,69,70,71
      ledRelojC1, ledRelojC2, ledUp: out std_logic; -- indicadores de cuenta, ritmo y flipflop logica negada, pines 3, 7, 9
      ledC1, ledC2: out std_logic_vector(3 downto 0) -- muestran la cuenta en binario, pines 51-53,55 y 57-60
    );
end entity;

architecture archProyecto of proyecto is
 -- señales para conectar del contador 1 al contador 2 y del contador 1 al decodificador respectivamente
    signal busConta, busDeco: std_logic_vector(3 downto 0);
 -- señales para conectar el timer como reloj del contador 1 y del flipflop, el cable para marcar el reloj del contador 2
    signal cableReloj, cableLdClk: std_logic;
 -- la salida del flipflop (down), su valor negado (up) que indica a los contadores si ir en ascenso (1) o descenso (0)
    signal down, up: std_logic;
 -- y la entrada al flipflop, una serie de compuertas cuya finalidad es detectar si se ha llegado al ultimo valor
    signal inff: std_logic;
    begin
        tock: entity work.tock
            port map(
                clk     => clk, -- entrada: reloj de 50MHz
                clr     => not clr, -- entrada: master reset, logica negada
                clk_out => cableReloj -- salida: reloj de 1 Hz
            );
        ledRelojC1 <= not cableReloj; --salida: led de 1 Hz logica negada
        C1: entity work.contAscDesBCD
            port map(
                clk     => cableReloj, --
                clr     => not clr, -- el push button trabaja en lógica negada
                Q       => busDeco,
                data    => busConta,
                load    => cableLdClk,
                up      => up
            );
        ledC1 <= busDeco;
        cableLdClk <= '1' when (busDeco = "1000" and up = '1') or (busDeco = "0000" and up = '0')
                      else '0';
        ledRelojC2 <= not cableLdClk; --los led del fpg son logica negada
        C2: entity work.contAscDesBCD
            port map(
                clk     => cableLdClk,
                clr     => not clr,  -- el push button trabaja en lógica negada
                Q       => busConta,
                up      => up
            );
        ledC2 <= busConta;
        DEC: entity work.decoCuenta
            port map(
                bcd     => busDeco,
                led     => seg
            );
        inff <= '1' when (busConta = "0000" and up = '0') or (busConta = "1000" and up = '1') else '0';
        FF: entity work.flipflop
            port map(
                clk     => cableReloj,
                clr     => not clr,  -- el push button trabaja en lógica negada
                T       => inff,
                Q       => down
            );
        up <= not down;
        ledUp <= not up; --los led del fpga son logica negada
end architecture archProyecto;
