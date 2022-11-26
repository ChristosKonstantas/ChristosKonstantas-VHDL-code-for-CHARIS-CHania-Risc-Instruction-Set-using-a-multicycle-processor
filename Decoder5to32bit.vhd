----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:10:31 03/06/2020 
-- Design Name: 
-- Module Name:    Decoder5to32bit - Behavioral 
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

entity Decoder5to32bit is
    Port ( Input : in  STD_LOGIC_VECTOR (4 downto 0);
           Dec_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Decoder5to32bit;

architecture Behavioral of Decoder5to32bit is

begin
process(Input)
begin

	Dec_out<=x"00000000";
	case Input is 
		when "00000" => Dec_out(0)<='0'; when "00001" => Dec_out(1)<='1'; when "00010" => Dec_out(2)<='1'; when "00011" => Dec_out(3)<='1';
		when "00100" => Dec_out(4)<='1'; when "00101" => Dec_out(5)<='1'; when "00110" => Dec_out(6)<='1'; when "00111" => Dec_out(7)<='1';
		when "01000" => Dec_out(8)<='1'; when "01001" => Dec_out(9)<='1'; when "01010" => Dec_out(10)<='1'; when "01011"=> Dec_out(11)<='1';
		when "01100" => Dec_out(12)<='1'; when "01101" => Dec_out(13)<='1'; when "01110" => Dec_out(14)<='1'; when "01111" => Dec_out(15)<='1';
		when "10000" => Dec_out(16)<='1'; when "10001" => Dec_out(17)<='1'; when "10010" => Dec_out(18)<='1'; when "10011" => Dec_out(19)<='1';
		when "10100" => Dec_out(20)<='1'; when "10101" => Dec_out(21)<='1'; when "10110" => Dec_out(22)<='1'; when "10111" => Dec_out(23)<='1';
		when "11000" => Dec_out(24)<='1'; when "11001" => Dec_out(25)<='1'; when "11010" => Dec_out(26)<='1'; when "11011" => Dec_out(27)<='1';
		when "11100" => Dec_out(28)<='1'; when "11101" => Dec_out(29)<='1'; when "11110" => Dec_out(30)<='1'; when "11111" => Dec_out(31)<='1';
		when others  => Dec_out <= x"00000000" ;
	end case;
end process;







end Behavioral;

