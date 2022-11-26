
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux2to1_5bits is
 Port ( In0 : in  STD_LOGIC_VECTOR (4 downto 0);
           In1 : in  STD_LOGIC_VECTOR (4 downto 0);
           SelectMux : in  STD_LOGIC;
           OutMux : out  STD_LOGIC_VECTOR (4 downto 0));
end Mux2to1_5bits;

architecture Behavioral of Mux2to1_5bits is


begin

OutMux<=In0 when SelectMux ='0' else
	 In1;
end Behavioral;

