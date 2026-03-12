library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tt_um_theli11 is
    port (
        ui_in   : in  std_logic_vector(7 downto 0);
        uo_out  : out std_logic_vector(7 downto 0);
        uio_in  : in  std_logic_vector(7 downto 0);
        uio_out : out std_logic_vector(7 downto 0);
        uio_oe  : out std_logic_vector(7 downto 0);
        ena     : in  std_logic;
        clk     : in  std_logic;
        rst_n   : in  std_logic
    );
end tt_um_theli11;

architecture Behavioral of tt_um_theli11 is
    signal a, b : unsigned(3 downto 0);
    signal op   : std_logic_vector(2 downto 0);
    signal r    : unsigned(3 downto 0);

    component sync is
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
    end component;

    component pe is
        port (
            a  : in  unsigned(3 downto 0);
            b  : in  unsigned(3 downto 0);
            op : in  std_logic_vector(2 downto 0);
            r  : out unsigned(3 downto 0)
        );
    end component;

begin

    sync_inst: sync
        port map (
            clk    => clk,
            ena    => ena,
            ui_in  => ui_in,
            uio_in => uio_in(2 downto 0),
            r      => r,
            a      => a,
            b      => b,
            op     => op,
            uo_out => uo_out
        );

    pe_inst: pe
        port map (
            a  => a,
            b  => b,
            op => op,
            r  => r
        );

    uio_out <= (others => '0');
    uio_oe  <= (others => '0');

end Behavioral;