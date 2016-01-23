library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl07 is
  port (
    gclk0 : in std_logic;
    led1 : out std_logic;
    led2 : out std_logic;
    led3 : out std_logic;
    led4 : out std_logic;
    led5 : out std_logic;
    led6 : out std_logic;
    led7 : out std_logic;
    led8 : out std_logic
  );
end vhdl07;

architecture rtl of vhdl07 is
  signal c : std_logic_vector (24 downto 0);
begin
  count : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      c <= c + 1;
    end if;
  end process;

  led8 <= not c (24);
  led7 <= not c (23);
  led6 <= not c (22);
  led5 <= not c (21);
  led4 <= not c (20);
  led3 <= not c (19);
  led2 <= not c (18);
  led1 <= not c (17);
end rtl;
