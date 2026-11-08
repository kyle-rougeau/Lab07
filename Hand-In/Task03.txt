library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DD_BCD_Cnt is
Port ( Clk, Enable, Load, Up, Clear : in STD_LOGIC;
       D0,D1 : in UNSIGNED (3 downto 0);
       Q0,Q1 : out UNSIGNED (3 downto 0);
       Co : out STD_LOGIC := '0' );
end DD_BCD_Cnt;

architecture behv of DD_BCD_Cnt is
Signal BCD0_Co, BCD1_enable, BCD1_up : STD_LOGIC := '0';
Signal BCD0_Q : UNSIGNED (3 downto 0);
begin

Q0 <= BCD0_Q;
BCD1_enable <= '1' when Enable = '1' and ((Up = '1' and BCD0_Q(0) = '1' and BCD0_Q(3) = '1') or (Up = '0' and BCD0_Q = "0000") or Load = '1') else '0';
BCD1_up <= '1' when BCD0_Q(0) = '1' and BCD0_Q(3) = '1' else '0';

BCD0 : entity work.BCD_Cnt Port Map ( clk => clk, enable => enable, load => Load, up => Up, clear => Clear, D => D0, Q => BCD0_Q, Co => BCD0_Co);
BCD1 : entity work.BCD_Cnt Port Map ( clk => clk, enable => BCD1_enable, load => Load, up => Up, clear => Clear, D => D1, Q => Q1, Co => Co);

end behv;