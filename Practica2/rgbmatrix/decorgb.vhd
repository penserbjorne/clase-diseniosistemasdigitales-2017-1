entity decorgb is
  port (
    sel: in  std_logic_vector(2 downto 0);
    sal: out std_logic_vector(7 downto 0)
  );
end entity;

architecture arch of decorgb is
begin
    with sel select
        sal <= "10000000" when "000",
               "01000000" when "001",
               "00100000" when "010",
               "00010000" when "001",
               "00001000" when "100",
               "00000100" when "101",
               "00000010" when "110",
               "00000001" when "111",
               'Z' when others;
end architecture;
