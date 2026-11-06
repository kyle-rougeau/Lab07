library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider is
Generic ( divisor : INTEGER);
Port ( clk_in : in STD_LOGIC;
       clk_out : out STD_LOGIC);
end divider;

architecture behv of divider is
Signal count : INTEGER := 0;
Signal state : STD_LOGIC := '0';
begin

process(clk_in)
begin
if rising_edge(clk_in) then
 if count < (divisor - 1) then
  count <= count + 1;
 else
  state <= not state;
  count <= 0;
 end if;
end if;
clk_out <= state;
end process;

end behv;