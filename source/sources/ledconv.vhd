library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ledconv is
  port (
    cnt : in std_logic_vector (3 downto 0);
    sledxa : out std_logic;
    sledxb : out std_logic;
    sledxc : out std_logic;
    sledxd : out std_logic;
    sledxe : out std_logic;
    sledxf : out std_logic;
    sledxg : out std_logic
  );
end ledconv;

architecture rtl of ledconv is
  signal sled : std_logic_vector (6 downto 0);
begin
  sled <= "0010000" when (cnt = "1001")
     else "0000000" when (cnt = "1000")
     else "1111000" when (cnt = "0111")
     else "0000010" when (cnt = "0110")
     else "0010010" when (cnt = "0101")
     else "0011001" when (cnt = "0100")
     else "0110000" when (cnt = "0011")
     else "0100100" when (cnt = "0010")
     else "1111001" when (cnt = "0001")
     else "1000000" when (cnt = "0000")
     else "0000110";
  sledxa <= sled (0);
  sledxb <= sled (1);
  sledxc <= sled (2);
  sledxd <= sled (3);
  sledxe <= sled (4);
  sledxf <= sled (5);
  sledxg <= sled (6);
end rtl;
