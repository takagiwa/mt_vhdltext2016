library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl05 is
  port (
    sw1 : in std_logic ; -- data
    sw2 : in std_logic ; -- clock
    sw3 : in std_logic ; -- reset
    led1 : out std_logic
  );
end vhdl05;

architecture rtl of vhdl05 is
  signal d : std_logic;
begin
  dff : process (sw2, sw3)
  begin
    if (sw3 = '1') then
      d <= '0';
    elsif (sw2'event and sw2 = '1') then
      d <= sw1;
    end if;
  end process;

  led1 <= d;
end rtl;
