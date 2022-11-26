----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:43 03/07/2020 
-- Design Name: 
-- Module Name:    Mux2to1_32bits - Behavioral 
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

entity Mux2to1_32bits is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           SelectMux : in  STD_LOGIC;
           OutMux : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux2to1_32bits;





architecture Behavioral of Mux2to1_32bits is

begin


process(SelectMux,In0,In1)
begin
if SelectMux = '0' then 
			OutMux<=In0; 
	else
			OutMux<=In1;
	end if;
end process;

end Behavioral;



