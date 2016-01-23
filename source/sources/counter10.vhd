library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter10 is
  port (
    gclk0 : in std_logic;
    sw1 : in std_logic;

    e_in : in std_logic;
    c_in : in std_logic;

    c_out : out std_logic;

    cnt : out std_logic_vector (3 downto 0)
) ;
end counte r10 ;

architecture rtl of counter10 is
  signal c : std_logic_vector (3 downto 0);
begin
  cnt_proc : process (sw1, gclk0)
  begin
    if (sw1 = '1') then
      c <= "0000";
    elsif (gclk0'event and gclk0 = '1') then
      if ((e_in = '1') and (c_in = '1')) then
        -- put code below --

        -- put code above --
      end if;
    end if;
  end process;

  c_out <= '1' when (c = "1001")
      else '0';
  cnt <= c;
end rtl;
