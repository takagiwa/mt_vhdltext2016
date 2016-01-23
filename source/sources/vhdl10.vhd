library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl10 is
  port (
    gclk0 : in std_logic;
    sw1 : in std_logic;
    led1 : out std_logic
  );
end vhdl10;

architecture rtl o f vhdl10 is
  signal c : std_logic_vector (14 downto 0);
  signal r : std_logic;
  signal d1 : std_logic;
  signal d2 : std_logic;
  signal s : std_logic;
  signal t : std_logic;
begin
  -- chattering cancel
  sum_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      if (sw1 = '0') then
        c <= "000000000000000";
      elsif ((c /= "111111111111111") and (sw1 = '1')) then
        c <= c + 1;
      end if;

      if (c = "111111111111111") then
        r <= '1';
      else
        r <= '0';
      end if;
    end if;
  end process;

  -- difference
  diff_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      d1 <= r;
      d2 <= d1;
    end if;
  end process;
  s <= d1 and (not d2);

  -- T flipflop
  t_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      if (s = '1') then
        t <= not t;
      end if;
    end if;
  end process;

  led1 <= t;
end rtl;
