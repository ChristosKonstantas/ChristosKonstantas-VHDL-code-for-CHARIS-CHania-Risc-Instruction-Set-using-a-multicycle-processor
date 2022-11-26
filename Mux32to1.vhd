
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

entity Mux32to1_a is
    Port ( Control : in  STD_LOGIC_VECTOR (4 downto 0); --sel1 = Adr1
			  In0,In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,
			  In17,In18,In19,In20,In21,In22,In23,In24,In25,In26,In27,In28,In29,In30,In31:  in  STD_LOGIC_VECTOR (31 downto 0);
           Mux_Outpt1 : out  STD_LOGIC_VECTOR (31 downto 0));

end Mux32to1_a;

architecture Behavioral of Mux32to1_a is

begin
process(Control,In0,In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,In17,In18,In19,In20,In21,In22,In23,In24,In25,In26,In27,In28,In29,In30,In31)
begin
case Control is 
			when "00000" => Mux_Outpt1<=In0;  when "00001" => Mux_Outpt1<=In1;  when "00010" => Mux_Outpt1<=In2;  when "00011" => Mux_Outpt1<=In3;
			when "00100" => Mux_Outpt1<=In4;  when "00101" => Mux_Outpt1<=In5;  when "00110" => Mux_Outpt1<=In6;  when "00111" => Mux_Outpt1<=In7;
			when "01000" => Mux_Outpt1<=In8;  when "01001" => Mux_Outpt1<=In9;  when "01010" => Mux_Outpt1<=In10; when "01011" => Mux_Outpt1<=In11;
			when "01100" => Mux_Outpt1<=In12; when "01101" => Mux_Outpt1<=In13; when "01110" => Mux_Outpt1<=In14; when "01111" => Mux_Outpt1<=In15;
			when "10000" => Mux_Outpt1<=In16; when "10001" => Mux_Outpt1<=In17; when "10010" => Mux_Outpt1<=In18; when "10011" => Mux_Outpt1<=In19;
			when "10100" => Mux_Outpt1<=In20; when "10101" => Mux_Outpt1<=In21; when "10110" => Mux_Outpt1<=In22; when "10111" => Mux_Outpt1<=In23;
			when "11000" => Mux_Outpt1<=In24; when "11001" => Mux_Outpt1<=In25; when "11010" => Mux_Outpt1<=In26; when "11011" => Mux_Outpt1<=In27;
			when "11100" => Mux_Outpt1<=In28; when "11101" => Mux_Outpt1<=In29; when "11110" => Mux_Outpt1<=In30; when "11111" => Mux_Outpt1<=In31;
			when others  => Mux_Outpt1 <= x"00000000" ;
		end case;
end process;

end Behavioral;

