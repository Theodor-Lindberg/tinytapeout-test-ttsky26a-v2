library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pe is
    port (
        a  : in  unsigned(3 downto 0);
        b  : in  unsigned(3 downto 0);
        op : in  std_logic_vector(2 downto 0);
        r  : out unsigned(3 downto 0)
    );
end pe;

architecture Behavioral of pe is
begin

    with op select
        r <=
            a + b        when "000",
            a - b        when "001",
            a and b      when "010",
            a or b       when "011",
            a xor b      when "100",
            not a        when "101",
            (others => '0') when others;

end Behavioral;
