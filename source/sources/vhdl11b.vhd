library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl11b is
  port (
    gclk0 : in std_logic;
    sw1 : in std_logic;
    sled1a : out std_logic;
    sled1b : out std_logic;
    sled1c : out std_logic;
    sled1d : out std_logic;
    sled1e : out std_logic;
    sled1f : out std_logic;
    sled1g : out std_logic
  );
end vhdl11b;

architecture rtl of vhdl11b is
  component counter10
    port (
      gclk0 : in std_logic;
      sw1 : in std_logic;

      e_in : in std_logic;
      c_in : in std_logic;

      c_out : out std_logic;

      cnt : out std_logic_vector (3 downto 0)
    );
  end component;

  component ledconv
    port (
      cnt : in std_logic_vector (3 downto 0);
      sledxa : out std_logic;
      sledxb : out std_logic;
      sledxc : out std_logic;
      sledxd : out std_logic;
      sledxe : out std_logic;
      sledxf : out std_logic;
      sledxg : out std_logic
    );
  end component;

  signal d : std_logic_vector (24 downto 0);
  signal r : std_logic;
  signal c_in1 : std_logic;
  signal c_out1 : std_logic;
  signal cnt1 : std_logic_vector (3 downto 0);
begin
  div_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      if (d = "1111010000100011111111111") then
        d <= "0000000000000000000000000";
        r <= '1';
      else
        d <= d + 1;
        r <= '0';
      end if;
    end if;
  end process;

  c_in1 <= '1';

  i_counter1 : counter10
    port map (
      gclk0 => gclk0,
      sw1 => sw1,
      e_in => r,
      c_in => c_in1,
      c_out => c_out1,
      cnt => cnt1
    );

  i_conv1 : ledconv
    port map (
      cnt => cnt1,
      sledxa => sled1a,
      sledxb => sled1b,
      sledxc => sled1c,
      sledxd => sled1d,
      sledxe => sled1e,
      sledxf => sled1f,
      sledxg => sled1g
    );
end rtl;
