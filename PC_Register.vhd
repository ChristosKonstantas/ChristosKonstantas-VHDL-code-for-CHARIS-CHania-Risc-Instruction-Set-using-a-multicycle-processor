----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:26 03/18/2020 
-- Design Name: 
-- Module Name:    PC_Register - Behavioral 
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

entity PC_Register is
       Port( Din : in std_logic_vector(31 downto 0);
			   LdEn : in std_logic;
			   clk : in std_logic;
			   Reset : in std_logic;
			   Dout : out std_logic_vector(31 downto 0)
			   );
end PC_Register;

architecture Behavioral of PC_Register is

begin

process(clk,LdEn,Reset,Din)
	begin
		if rising_edge(Clk) then
			if(LdEn = '1') then
				Dout <= Din(31 downto 2)&"00";
			end if;
		end if;
		if Reset = '1' then
			Dout<=x"00000000";
		end if;
	end process;

	


end Behavioral;


