library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sync is
    port (
        clk    : in  std_logic;
        ena    : in  std_logic;
        ui_in  : in  std_logic_vector(7 downto 0);
        uio_in : in  std_logic_vector(2 downto 0);
        r      : in  unsigned(3 downto 0);
        a      : out unsigned(3 downto 0);
        b      : out unsigned(3 downto 0);
        op     : out std_logic_vector(2 downto 0);
        uo_out : out std_logic_vector(7 downto 0)
    );
end sync;

architecture Behavioral of sync is
begin

    sync_proc: process(clk) is
    begin
        if rising_edge(clk) then
            if ena = '1' then
                a      <= unsigned(ui_in(3 downto 0));
                b      <= unsigned(ui_in(7 downto 4));
                op     <= uio_in(2 downto 0);
                uo_out <= "0000" & std_logic_vector(r);
            end if;
        end if;
    end process;

end Behavioral;
