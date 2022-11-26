
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEMSTAGE is
    Port ( clk : in std_logic;
			  ByteOp : in  STD_LOGIC;
           MEM_WrEn : in  STD_LOGIC; -- flag to enable write in memory
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0); -- alu result
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);  -- RF(rd) gia sw sb
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0); -- dedomena gia load
           MM_Addr : out  STD_LOGIC_VECTOR (31 downto 0); -- dieuthinsi pros ram
           MM_WrEn : out  STD_LOGIC; 
           MM_WrData : out  STD_LOGIC_VECTOR (31 downto 0); --dedomena gia eggrafh sth mnhmh
           MM_RdData : in  STD_LOGIC_VECTOR (31 downto 0));
end MEMSTAGE;




architecture Behavioral of MEMSTAGE is

signal MM_WrDataSig,MEM_DataOutSig : STD_LOGIC_VECTOR (31 downto 0);

begin

MM_Addr <= ("00" & ALU_MEM_Addr(31 downto 2))+"00000000000000000000010000000000"; -- + 0x400
MM_WrEn <= MEM_WrEn ;



MM_WrDataSig <=  MEM_DataIn  when ByteOp='0'
						 else
                   "000000000000000000000000"&MEM_DataIn(7 downto 0) when ByteOp='1'
						 else
						 MM_WrDataSig;
						 
MM_WrData<=MM_WrDataSig ;

MEM_DataOutSig <=  MM_RdData  when ByteOp='0'
						 else
                   "000000000000000000000000"&MM_RdData(7 downto 0) when ByteOp='1'
						 else
						 MEM_DataOutSig;
						 
MEM_DataOut<=MEM_DataOutSig ;



end Behavioral;

