----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:05:15 05/21/2020 
-- Design Name: 
-- Module Name:    ALURegister - Behavioral 
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

entity ALURegister is
    Port ( Result : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           Zero_out : out  STD_LOGIC);
end ALURegister;

architecture Behavioral of ALURegister is

begin

process(Clk,Result,Zero)
	begin
		if rising_edge(Clk) then
				Output <= Result;
				Zero_out <= Zero;
		end if;
	end process;


end Behavioral;

