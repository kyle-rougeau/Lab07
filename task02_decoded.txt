library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Cnt_Decoded is
Port ( clk, enable, load, up, clear : in STD_LOGIC;
       D : in UNSIGNED (3 downto 0);
       --DEBUG : out UNSIGNED (3 downto 0);
       --debug0, debug1 : out STD_LOGIC;
       to_sseg : out UNSIGNED (7 downto 0));
end BCD_Cnt_decoded;

architecture comp of BCD_Cnt_Decoded is

component BCD_Cnt
Port ( clk, enable, load, up, clear : in STD_LOGIC;
       D : in UNSIGNED (3 downto 0);
       Q : out UNSIGNED (3 downto 0);
       Co : out STD_LOGIC := '0' );
end component;

component decoder
Port ( in_vec : in UNSIGNED (3 downto 0);
       out_vec : out UNSIGNED (7 downto 0) );
end component;

component divider
Generic ( divisor : INTEGER);
Port ( clk_in : in STD_LOGIC;
       clk_out : out STD_LOGIC);
end component;

Signal in_vec_buffer0 : UNSIGNED (3 downto 0) := (others=>'0');
--Signal in_vec_buffer1 : UNSIGNED (7 downto 0) := (others=>'0');
Signal clk_buffer0, clk_buffer1 : STD_LOGIC := '0';

begin

divider_inst0 : divider
Generic Map (divisor => 5)
Port Map (clk_in => clk, clk_out => clk_buffer0);

divider_inst1 : divider
Generic Map (divisor => 5)
Port Map (clk_in => clk_buffer0, clk_out => clk_buffer1);

BCD_Cnt_inst : BCD_Cnt
Port Map (clk => clk_buffer1, enable => enable, load => load, up => up, clear => clear, D => D, Q => in_vec_buffer0);

decoder_inst : decoder
Port Map (in_vec => in_vec_buffer0, out_vec => to_sseg);

end comp;
