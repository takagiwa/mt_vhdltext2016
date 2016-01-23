library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity swfilter is
  port (
    gclk0 : in std_logic;
    sw : in std_logic;
    sw_out : out std_logic
  );
end swfilter;

architecture rtl of swfilter is
  signal c : std_logic_vector (14 downto 0);
  signal r : std_logic;
  signal d1 : std_logic;
  signal d2 : std_logic;
  signal s : std_logic;
begin
  sum_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      if (sw = '0') then
        c <= "000000000000000";
      elsif ((c /= "111111111111111") and (sw = '1')) then
        c <= c + 1;
      end if;

      if (c = "111111111111111") then
        r <= '1';
      else
        r <= '0';
      end if;
    end if;
  end process;

  diff_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      d1 <= r;
      d2 <= d1;
      s <= d1 and (not d2);
    end if;
  end process;

  sw out <= s;
end rtl;
