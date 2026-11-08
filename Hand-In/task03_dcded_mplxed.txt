library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dd_bcd_for_sseg is
Port ( Clk, Enable, Load, Up, Clear : in STD_LOGIC;
       D0, D1 : in UNSIGNED (3 downto 0);
       pattern : out UNSIGNED (7 downto 0);
       selection  : out UNSIGNED (1 downto 0) );
end dd_bcd_for_sseg;

architecture comp of dd_bcd_for_sseg is

component DD_BCD_Cnt
Port ( Clk, Enable, Load, Up, Clear : in STD_LOGIC;
       D0,D1 : in UNSIGNED (3 downto 0);
       Q0,Q1 : out UNSIGNED (3 downto 0);
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

Signal digit0, digit1, to_display : UNSIGNED (3 downto 0) := "0000";
Signal slowclock, slowerclock, state : STD_LOGIC := '0';

begin

divider_inst0 : divider
Generic Map (divisor => 2)
Port Map (clk_in => clk, clk_out => slowclock);

divider_inst1 : divider
Generic Map (divisor => 2)
Port Map (clk_in => slowclock, clk_out => slowerclock);

DD_BCD_Cnt_inst : DD_BCD_Cnt
Port Map (clk => slowerclock, enable => enable, load => load, up => up, clear => clear, D0 => D0, D1 => D1, Q0 => digit0, Q1 => digit1);

decoder_inst : decoder
Port Map (in_vec => to_display, out_vec => pattern);

selection <= "01" when state = '0' else "10";
to_display <= digit0 when state = '0' else digit1;

process(Clk)
begin
if rising_edge(Clk) then
 state <= not state;
end if;
end process;

end comp;
