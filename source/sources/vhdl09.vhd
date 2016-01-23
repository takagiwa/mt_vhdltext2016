library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl09 is
  port (
  gclk0 : in std_logic;
  led1 : out std_logic
  );
end vhdl09;

architecture rtl of vhdl09 is
  signal c : std_logic_vector (24 downto 0); -- counter
  signal r : std_logic; -- invert t when it is H level
  signal t : std_logic; -- T flipflop
begin
  cnt_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
       -- put code below --

       -- put code above --
    end if;
  end process;

  t_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
       -- put code below --

       -- put code above --
    end if;
  end process;

  led1 <= t;
end rtl;
