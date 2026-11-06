library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Cnt is
Port ( clk, enable, load, up, clear : in STD_LOGIC;
       D : in UNSIGNED (3 downto 0);
       Q : out UNSIGNED (3 downto 0);
       Co : out STD_LOGIC := '0' );
end BCD_Cnt;

architecture behv of BCD_Cnt is
Signal count : UNSIGNED (3 downto 0) := "0000";
begin

Q <= count;

process(clk, clear)
begin
if rising_edge(clk)then
 Co <= '0';
if enable = '1' then
 if load = '1' then
  assert D < 10
  report "D Cannot be greater than 9 (1001)"
  severity failure;
  count <= D;
 elsif up = '1' then
  if count = 9 then
   Co <= '1';
   count <= "0000";
  else
   count <= count + 1;
  end if;
 else
  if count = 0 then
   Co <= '1';
   count <= "1001";
  else
   count <= count - 1;
  end if;
 end if;
end if;
end if;
if rising_edge(clear) then
 count <= "0000";
end if;
end process;

end behv;
