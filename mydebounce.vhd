----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2025 07:51:45 PM
-- Design Name: 
-- Module Name: debounce_filter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounceFilter is
generic (threshold: INTEGER := 20);
    Port ( clk : in STD_LOGIC;
           bouncy : in STD_LOGIC;
           debounced : out STD_LOGIC);
end debouncefilter;

architecture behv of debounceFilter is
signal count : INTEGER range 0 to threshold := 0;
signal state : STD_LOGIC := '0';

begin
process(clk) 
begin 
if rising_edge(clk) then 

--If the input has held steady at a state other than the current state for the threshold amount of clock cycles, set the state to the input
if count = threshold then
state <= bouncy;
count <= 0;

--Else if, the input is currently not equal to the state, increment the count
elsif bouncy /= state then
count <= count + 1;

--Otherwise, reset the count
else 
count <= 0;
end if;

end if;
end process;

debounced <= state;


end behv;
