----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:25 05/08/2020 
-- Design Name: 
-- Module Name:    ALU_REG - Behavioral 
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

entity ALU_REG is
    Port ( Clk : in  STD_LOGIC;
	        RF_B_In : in  STD_LOGIC_VECTOR (31 downto 0);
			  RF_B_Out : out  STD_LOGIC_VECTOR (31 downto 0);
	        ALU_Out_In : in  STD_LOGIC_VECTOR (31 downto 0);
           ZeroOut_In : in  STD_LOGIC;
			  rd_In : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_Out : out  STD_LOGIC_VECTOR (4 downto 0);
           ALU_Out_Out : out  STD_LOGIC_VECTOR (31 downto 0);
           ZeroOut_Out : out  STD_LOGIC);
end ALU_REG;


architecture Behavioral of ALU_REG is

begin

process(Clk)
	begin
		if rising_edge(Clk) then
				ALU_Out_Out <= ALU_Out_In;
				ZeroOut_Out <= ZeroOut_In;
				rd_Out      <= rd_In;
				RF_B_Out    <= RF_B_In;
		end if;
	end process;

end Behavioral;
