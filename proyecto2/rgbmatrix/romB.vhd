library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rom is
    port (
        clk  : in  std_logic;
        en   : in  std_logic := '1';
        addr : in  std_logic_vector(10 downto 0);
        data : out std_logic_vector(11 downto 0)
    );
end rom;

architecture arch of rom is
    type memoria_rom is array (0 to 2047) of std_logic_vector (11 downto 0);
    constant ROM : memoria_rom := (

    );
    signal tmp: std_logic_vector(11 downto 0);
begin

    retrive: process (addr, clk) begin
        if (clk' event and clk = '1') then
            tmp <= ROM(conv_integer(addr));
        end if;
    end process;

    buffer: process (tmp, en) begin
        if(en = '1') then
            data <= tmp;
        else
            data <= (others => 'Z');
        end if;
    end process buff;
end arch;
