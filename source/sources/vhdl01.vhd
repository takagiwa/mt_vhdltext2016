library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl01 is
  port (
    sw1  : in std_logic;
    sw2  : in std_logic;
    led1 : out std_logic;
    led2 : out std_logic;
    led3 : out std_logic;
    led4 : out std_logic;
    led5 : out std_logic
  );
end vhdl01;

architecture rtl of vhdl01 is
begin
  led1 <= sw1;
  led2 <= sw2;
  led3 <= sw1 and sw2;
  led4 <= sw1 or sw2;
  led5 <= not sw1;
end rtl;
