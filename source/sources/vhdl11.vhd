library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl11 is
  port (
    gclk0 : in std_logic;
    led1 : out std_logic;
    sled1a : out std_logic;
    sled1b : out std_logic;
    sled1c : out std_logic;
    sled1d : out std_logic;
    sled1e : out std_logic;
    sled1f : out std_logic;
    sled1g : out std_logic
  );
end vhdl11;

architecture rtl of vhdl11 is
  signal d : std_logic_vector (24 downto 0);
  signal r : std_logic;
  signal c : std_logic_vector (3 downto 0);
  signal s l e d : std_logic_vector (6 downto 0);
  signal ck : std_logic;
begin
  div_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      d <= d + 1;
      if (d = "1111010000100011111111111") then
        r <= '1';
        d <= "0000000000000000000000000";
      else
        r <= '0';
      end if;
    end if;
  end process;

  cnt_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
       -- put code below --

       -- put code above --
    end if;
  end process;

  chk_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      if (c = "1010") then
        ck <= not ck;
      end if;
    end if;
  end process;

  sled <= "0010000" when (c = "1001")
     else "0000000" when (c = "1000")
     else "1111000" when (c = "0111")
     else "0000010" when (c = "0110")
     else "0010010" when (c = "0101")
     else "0011001" when (c = "0100")
     else "0110000" when (c = "0011")
     else "0100100" when (c = "0010")
     else "1111001" when (c = "0001")
     else "1000000" when (c = "0000")
     else "0000110";
  sled1a <= sled (0);
  sled1b <= sled (1);
  sled1c <= sled (2);
  sled1d <= sled (3);
  sled1e <= sled (4);
  sled1f <= sled (5);
  sled1g <= sled (6);

  led1 <= ck;
end rtl;
