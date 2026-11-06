library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity task01 is
Port ( clk, x : in  STD_LOGIC;
       s, v   : out STD_LOGIC );
end task01;

architecture behv of task01 is
Signal state : UNSIGNED (2 downto 0) := "000";
begin
process(clk)
begin
if rising_edge(clk) then
 case state is
 when "000" => --base | c=0, s=1
  if x = '1' then
   s <= '0';
   v <= '0';
   state <= "010";
  else
   s <= '1';
   v <= '0';
   state <= "001";
  end if;
 when "001" => --no_carry0 | c=0, s=1
  if x = '1' then
   s <= '0';
   state <= "100";
  else
   s <= '1';
   state <= "011";
  end if;
 when "010" => --carry0 | c=1, s=1
  if x = '1' then
   s <= '1';
   state <= "100";
  else
   s <= '0';
   state <= "100";
  end if;
 when "011" => --no_carry1 | c=0, s=0
  if x = '1' then
   s <= '1';
   state <= "101";
  else
   s <= '0';
   state <= "101";
  end if;
 when "100" => --carry1 | c=1, s=0
  if x = '1' then
   s <= '0';
   state <= "110";
  else
   s <= '1';
   state <= "101";
  end if;
 when "101" => --no_carry2 | c=0, s=0
  if x = '1' then
   s <= '1';
   state <= "000";
  else
   s <= '0';
   state <= "000";
  end if;
 when "110" => --carry2 | c=1, s=0
  if x = '1' then
   s <= '0';
   v <= '1';
   state <= "000";
  else
   s <= '1';
   state <= "000";
  end if;
 when others =>
 end case;

end if;
end process;
end behv;
