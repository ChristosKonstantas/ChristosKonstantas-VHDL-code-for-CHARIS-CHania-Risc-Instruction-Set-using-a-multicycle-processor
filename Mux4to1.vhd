----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:13 05/08/2020 
-- Design Name: 
-- Module Name:    Mux4to1 - Behavioral 
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

entity Mux4to1 is
    Port ( in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in2 : in  STD_LOGIC_VECTOR (31 downto 0);
           in3 : in  STD_LOGIC_VECTOR (31 downto 0);
           in4 : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           outpt : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux4to1;

architecture Behavioral of Mux4to1 is

begin
process(control,in1,in2,in3,in4)
begin
	if Control = "00" then
		outpt<=in1;
	elsif Control = "01" then
		outpt<=in2;
	elsif Control = "10" then
		outpt<=in3;
	else
		outpt<=in4;
	end if;
end process;



end Behavioral;
