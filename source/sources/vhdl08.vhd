library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl08 is
  port (
  gclk0 : in std_logic;
  led1 : out std_logic;
  led2 : out std_logic
  );
end vhdl08;

architecture rtl of vhdl08 is
  signal c : std_logic_vector (1 downto 0);
  signal r : std_logic;
begin
  div_proc : process (gclk0)
  begin
    if (gclk0'event and gclk0 = '1') then
      c <= c + 1;
      if (c = "11") then
        r <= '1';
      else
        r <= '0';
      end if;
    end if;
  end process;

  led1 <= not r;
  led2 <= '0';
end rtl;
