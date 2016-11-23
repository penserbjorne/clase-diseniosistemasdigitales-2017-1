----------------------------------------------------------------------------------
-- Engineer: 	
-- Create Date:    05:36:49 11/23/2016 
-- Module Name:    SegundoExamenVicflo - Behavioral  
-- Description: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SegundoExamenVicflo is
	port(
clk : in std_logic;
		reset : in std_logic;
		rev : in std_logic_vector(3 downto 0);
		velOut : out std_logic_vector(2 downto 0)
	);
end SegundoExamenVicflo;

architecture Behavioral of SegundoExamenVicflo is

	-- Timer
	signal pulso : std_logic;
	signal cont : integer range 0 to 24999999 := 0;
	-- Estados
	signal Ep : std_logic_vector(2 downto 0) := "000";
	signal Es : std_logic_vector(2 downto 0);
	constant E0 : std_logic_vector(2 downto 0) := "000";
	constant E1 : std_logic_vector(2 downto 0) := "001";
	constant E2 : std_logic_vector(2 downto 0) := "010";
	constant E3 : std_logic_vector(2 downto 0) := "011";
	constant E4 : std_logic_vector(2 downto 0) := "100";
	constant E5 : std_logic_vector(2 downto 0) := "101";
	
begin

	-- Timer de 1 seg (Para la Spartan 3)
	process(clk)
	begin
		if rising_edge(clk) then
			if cont = 24999999 then
				cont <= 0;
				pulso <= not pulso;
			else
				cont <= cont + 1;
			end if;
		end if;
	end process;

	-- Maquina de estados
	process(pulso, Es)
	begin
		if rising_edge(pulso) then
			case Es is
				when E0 => Ep <= Es;
							  if rev = x"0" then
									Es <= E0;
								elsif rev = x"1" then
									Es <= E1;
							  end if;
				when E1 => Ep <= Es;
							  if rev = x"0" then
									Es <= E0;
							  elsif rev = x"1" then
									Es <= E1;
							  elsif rev = x"2" then
									Es <= E1;
							  elsif rev = x"3" then
									Es <= E2;
							  end if;
				when E2 => Ep <= Es;
							  if rev = x"0" then
									Es <= E1;
							  elsif rev = x"1" then
									Es <= E1;
							  elsif rev = x"2" then
									Es <= E1;
							  elsif rev = x"3" then
									Es <= E2;
							  elsif rev = x"4" then
									Es <= E2;
							  elsif rev = x"5" then
									Es <= E3;
							  end if;
				when E3 => Ep <= Es;
							  if rev = x"0" then
									Es <= E2;
							  elsif rev = x"1" then
									Es <= E2;
							  elsif rev = x"2" then
									Es <= E2;
							  elsif rev = x"3" then
									Es <= E2;
							  elsif rev = x"4" then
									Es <= E2;
							  elsif rev = x"5" then
									Es <= E3;
							  elsif rev = x"6" then
									Es <= E3;
							  elsif rev = x"7" then
									Es <= E4;
							  end if;
				when E4 => Ep <= Es;
							  if rev = x"0" then
									Es <= E3;
							  elsif rev = x"1" then
									Es <= E3;
							  elsif rev = x"2" then
									Es <= E3;
							  elsif rev = x"3" then
									Es <= E3;
							  elsif rev = x"4" then
									Es <= E3;
							  elsif rev = x"5" then
									Es <= E3;
							  elsif rev = x"6" then
									Es <= E3;
							  elsif rev = x"7" then
									Es <= E4;
							  elsif rev = x"8" then
									Es <= E4;
							  elsif rev = x"9" then
									Es <= E5;
							  end if;
				when E5 => Ep <= Es;
							  if rev = x"0" then
									Es <= E4;
							  elsif rev = x"1" then
									Es <= E4;
							  elsif rev = x"2" then
									Es <= E4;
							  elsif rev = x"3" then
									Es <= E4;
							  elsif rev = x"4" then
									Es <= E4;
							  elsif rev = x"5" then
									Es <= E4;
							  elsif rev = x"6" then
									Es <= E4;
							  elsif rev = x"7" then
									Es <= E4;
							  elsif rev = x"8" then
									Es <= E4;
							  elsif rev = x"9" then
									Es <= E5;
							  else
									Es <= E5;
							  end if;
				when others => Ep <= Es;
							  Es <= E0;
			end case;	
		end if;
	end process;	
	
	--velOut = Ep;
	
end Behavioral;

