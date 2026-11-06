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
out_vec <= "00000011";
when 1 =>
out_vec <= "10011111";
when 2 =>
out_vec <= "00100101";
when 3 =>
out_vec <= "00001101";
when 4 =>
out_vec <= "10011001";
when 5 =>
out_vec <= "01001001";
when 6 =>
out_vec <= "01000001";
when 7 =>
out_vec <= "00011111";
when 8 =>
out_vec <= "00000001";
when 9 =>
out_vec <= "00011001";
when others =>
out_vec <= "00000000";
end case;
end process;

end behv;
