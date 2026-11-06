library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder is
Port ( in_vec : in UNSIGNED (7 downto 0);
       out_vec : out UNSIGNED (7 downto 0) );
end decoder;

architecture behv of decoder is
begin

process(in_vec)
begin
case to_integer(in_vec) is
when 0 =>
out_vec <= "11111100";
when 1 =>
out_vec <= "01100000";
when 2 =>
out_vec <= "11011010";
when 3 =>
out_vec <= "11110010";
when 4 =>
out_vec <= "01100110";
when 5 =>
out_vec <= "10110110";
when 6 =>
out_vec <= "10111110";
when 7 =>
out_vec <= "11100000";
when 8 =>
out_vec <= "11111110";
when 9 =>
out_vec <= "11100110";
when others =>
out_vec <= "11111111";
end case;
end process;

end behv;
