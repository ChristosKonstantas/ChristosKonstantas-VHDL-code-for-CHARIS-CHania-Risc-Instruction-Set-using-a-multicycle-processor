
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity branchMux2to1 is
    Port ( in0 : in  STD_LOGIC_VECTOR(31 downto 0);
           in1 : in  STD_LOGIC_VECTOR(31 downto 0) ;
			  selectMux : in std_logic;
           output : out  STD_LOGIC_VECTOR(31 downto 0));
end branchMux2to1;


architecture Behavioral of branchMux2to1 is

begin

output<=in0 when selectMux ='0' else
	 in1;

end Behavioral;
