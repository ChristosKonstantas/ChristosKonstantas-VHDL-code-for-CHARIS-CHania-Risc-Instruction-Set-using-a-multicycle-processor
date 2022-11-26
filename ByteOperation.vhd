
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity StoreLoadOperation is
    Port ( Op : in  STD_LOGIC_VECTOR (5 downto 0);
           ByteOp : out  STD_LOGIC);
end StoreLoadOperation;

architecture Behavioral of StoreLoadOperation is

signal ByteOpSignal : std_logic;

begin



ByteOpSignal <=  '0'  when Op="001111" or Op="011111" 
						 else
                   '1' 	when Op="000011" or Op="000111"
						 else
						 ByteOpSignal;
ByteOp<=ByteOpSignal;

end Behavioral;

