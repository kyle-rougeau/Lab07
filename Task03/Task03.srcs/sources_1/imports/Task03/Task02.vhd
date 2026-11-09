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

process(count)
begin
Q <= count;
end process;

process(clk, clear)
begin
if clear = '1' then
 count <= "0000";
end if;
if rising_edge(clk)then
 Co <= '0';
if enable = '1' then
 if load = '1' then
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

end process;

end behv;
