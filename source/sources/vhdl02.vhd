library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vhdl02 is
  port (
    sw1 : in std_logic;
    sw2 : in std_logic;
    sw3 : in std_logic;
    sw4 : in std_logic;
    sw5 : in std_logic;
    sw6 : in std_logic;
    sw7 : in std_logic;
    sw8 : in std_logic;

    led1 : out std_logic;
    led2 : out std_logic;
    led3 : out std_logic;
    led4 : out std_logic;
    led5 : out std_logic;
    led6 : out std_logic;
    led7 : out std_logic;
    led8 : out std_logic;

    sled1a : out std_logic;
    sled1b : out std_logic;
    sled1c : out std_logic;
    sled1d : out std_logic;
    sled1e : out std_logic;
    sled1f : out std_logic;
    sled1g : out std_logic;
    sled2a : out std_logic;
    sled2b : out std_logic;
    sled2c : out std_logic;
    sled2d : out std_logic;
    sled2e : out std_logic;
    sled2f : out std_logic;
    sled2g : out std_logic
  );
end vhdl02;

architecture rtl of vhdl02 is
  signal s_sw1 : std_logic;
  signal s_sw2 : std_logic;
  signal s_sw3 : std_logic;
  signal s_sw4 : std_logic;
  signal s_sw5 : std_logic;
  signal s_sw6 : std_logic;
  signal s_sw7 : std_logic;
  signal s_sw8 : std_logic;

  signal sw : std_logic_vector(8 downto 1);

  signal add : std_logic_vector(4 downto 1);
  signal sub : std_logic_vector(4 downto 1);

  signal led71 : std_logic_vector(6 downto 0);
  signal led72 : std_logic_vector(6 downto 0);
begin
  -- fixed polarity
  -- revision 2
  -- s_sw1 <= sw1;
  -- s_sw2 <= sw2;
  -- s_sw3 <= sw3;
  -- s_sw4 <= sw4;
  -- s_sw5 <= sw5;
  -- s_sw6 <= sw6;
  -- s_sw7 <= sw7;
  -- s_sw8 <= sw8;
  -- revision 1 (no revision)
  s_sw1 <= not sw1;
  s_sw2 <= not sw2;
  s_sw3 <= not sw3;
  s_sw4 <= not sw4;
  s_sw5 <= not sw5;
  s_sw6 <= not sw6;
  s_sw7 <= not sw7;
  s_sw8 <= not sw8;

  -- left 4 switches & right 4 switches
  -- left switch is MSB
  sw <= s_sw1 & s_sw2 & s_sw3 & s_sw4 & s_sw5 & s_sw6 & s_sw7 & s_sw8;

  add(4 downto 1) <= sw(8 downto 5) + sw(4 downto 1);
  sub(4 downto 1) <= sw(8 downto 5) - sw(4 downto 1);

  -- make 7 seg LED bit map
  led71 <= "0010000" when (add = "1001")
      else "0000000" when (add = "1000")
      else "1111000" when (add = "0111")
      else "0000010" when (add = "0110")
      else "0010010" when (add = "0101")
      else "0011001" when (add = "0100")
      else "0110000" when (add = "0011")
      else "0100100" when (add = "0010")
      else "1111001" when (add = "0001")
      else "1000000" when (add = "0000")
      else "0000110" ;
  led72 <= "0010000" when (sub = "1001")
      else "0000000" when (sub = "1000")
      else "1111000" when (sub = "0111")
      else "0000010" when (sub = "0110")
      else "0010010" when (sub = "0101")
      else "0011001" when (sub = "0100")
      else "0110000" when (sub = "0011")
      else "0100100" when (sub = "0010")
      else "1111001" when (sub = "0001")
      else "1000000" when (sub = "0000")
      else "0000110" ;

  -- map to pin
  sled1a <= led71(0);
  sled1b <= led71(1);
  sled1c <= led71(2);
  sled1d <= led71(3);
  sled1e <= led71(4);
  sled1f <= led71(5);
  sled1g <= led71(6);
  sled2a <= led72(0);
  sled2b <= led72(1);
  sled2c <= led72(2);
  sled2d <= led72(3);
  sled2e <= led72(4);
  sled2f <= led72(5);
  sled2g <= led72(6);

  -- debug
  led1 <= not add(4);
  led2 <= not add(3);
  led3 <= not add(2);
  led4 <= not add(1);
  led5 <= not sub(4);
  led6 <= not sub(3);
  led7 <= not sub(2);
  led8 <= not sub(1);
end rtl;
