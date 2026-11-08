library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity task01_db is
Port ( clk, button, x : in  STD_LOGIC;
       s, v   : out STD_LOGIC );
end task01_db;

architecture comp of task01_db is
Signal button_db : STD_LOGIC := '0';

component debounceFilter
 Generic ( threshold : INTEGER );
 Port ( clk : in STD_LOGIC;
        bouncy : in STD_LOGIC;
        debounced : out STD_LOGIC );
end component;

component task01
 Port ( clk, x : in  STD_LOGIC;
        s, v   : out STD_LOGIC );
end component;

begin

mydebounce_inst : debounceFilter
 Generic Map ( threshold => 250000 )
 Port Map ( clk => clk, bouncy => button, debounced => button_db );

task01_inst : task01
 Port Map ( clk => button_db, x => x, s => s, v => v );

end comp;
