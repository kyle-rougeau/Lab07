library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Cnt_Decoded is
Port ( clk, enable, load, up, clear : in STD_LOGIC;
       D : in UNSIGNED (3 downto 0);
       to_sseg : out UNSIGNED (7 downto 0) );
end BCD_Cnt_decoded;

architecture comp of BCD_Cnt_Decoded is

component BCD_Cnt
Port ( clk, enable, load, up, clear : in STD_LOGIC;
       D : in UNSIGNED (3 downto 0);
       Q : out UNSIGNED (3 downto 0);
       Co : out STD_LOGIC := '0' );
end component;

component decoder
Port ( in_vec : in UNSIGNED (7 downto 0);
       out_vec : out UNSIGNED (7 downto 0) );
end component;

component divider
Generic ( divisor : INTEGER);
Port ( clk_in : in STD_LOGIC;
       clk_out : out STD_LOGIC);
end component;

Signal in_vec_buffer : UNSIGNED (7 downto 0) := "00000000";
Signal clk_buffer0, clk_buffer1 : STD_LOGIC := '0';

begin

divider_inst0 : divider
Generic Map (divisor => 50)
Port Map (clk_in => clk, clk_out => clk_buffer0);

divider_inst1 : divider
Generic Map (divisor => 50)
Port Map (clk_in => clk_buffer0, clk_out => clk_buffer1);

BCD_Cnt_inst : BCD_Cnt
Port Map (clk => clk_buffer1, enable => enable, load => load, up => up, clear => clear, D => D, Q => in_vec_buffer (3 downto 0));

decoder_inst : decoder
Port Map (in_vec => in_vec_buffer, out_vec => to_sseg);

end comp;
