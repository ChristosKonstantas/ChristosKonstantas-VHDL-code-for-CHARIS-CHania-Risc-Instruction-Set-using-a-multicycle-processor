----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:53:22 03/04/2018 
-- Design Name: 
-- Module Name:    Comparator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myComparator is
    Port ( Input1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (4 downto 0);
           OutC : out  STD_LOGIC;
			  WE : in STD_LOGIC);
end myComparator;

architecture Behavioral of myComparator is

begin
process(Input1,Input2,WE)
begin
	if WE = '1' then
		if Input1 = Input2 then
			OutC<='1';
		else
			OutC<='0';
		end if;
	else
		OutC<='0';
	end if;
end process;
end Behavioral;

