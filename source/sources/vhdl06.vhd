library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl06 is
  port (
    sw1 : in std_logic; -- J
    sw2 : in std_logic; -- clock
    sw3 : in std_logic; -- K
    sw4 : in std_logic; -- reset
    led1 : out std_logic
  );
end vhdl06;

architecture rtl of vhdl06 is
  signal jk : std_logic;
begin
  jkff_proc : process (sw4, sw2)
  begin
    if (sw4 = '1') then
       -- put code below --

       -- put code above --
    elsif (sw2'event and sw2 = '1') then
       -- put code below --

       -- put code above --
    end if;
  end process;

  led1 <= jk;
end rtl;
