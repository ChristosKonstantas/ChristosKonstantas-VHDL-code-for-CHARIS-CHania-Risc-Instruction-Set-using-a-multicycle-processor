library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Extender is
		port( Immed : in std_logic_vector(15 downto 0);
				Ext_Out : out std_logic_vector(31 downto 0);
    			Imm_Ext : in std_logic_vector(1 downto 0)
				);
end Extender;

architecture Behavioral of Extender is

signal Ext_Out_Signal : std_logic_vector(31 downto 0);
signal Imm_Ext_Signal : std_logic_vector(1 downto 0);



begin

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                   ---SignExt(Imm)
Ext_Out_Signal <= Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed when Imm_Ext="00" ---SignExtend(Imm)
						 else
						 --signExt(Imm)<<2
                   Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed&"00" 	when Imm_Ext="01" --signExt(Imm)<<2
						 else
						 --zeroFill(Imm)
		             "0000000000000000"&Immed  when Imm_Ext="10"--zeroFill(Imm)
						 else
						 --zeroFill(Imm)<<16
		             Immed&"0000000000000000" when  Imm_Ext="11"--zeroFill(Imm)<<16
						 else
		             Ext_Out_Signal;
Ext_Out <= Ext_Out_Signal;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--						--Imm_Ext Truth table--
--						--00->SignExt 01-> SignExt(Imm)<<2 10->zeroFill(Imm) 11->zeroFill(Imm)<<16----
--						
--						--SignExt
--Imm_Ext_Signal <=  "00" when Op="111000" or Op="110000" or Op="000111" or Op="000011" or Op="001111" or Op="011111" ---SignExtend(Imm)
--						 else
--						 --signExt(Imm)<<2
--                   "01" 	when Op="111111" or Op="000000" or Op="000001" 
--						 else
--						 --zeroFill(Imm)
--		             "10"  when Op="110010" or Op="110011"
--						 else
--						 --zeroFill(Imm)<<16
--		             "11" when Op="111001" 
--						 else
--		             Imm_Ext_Signal;
--
--Imm_Ext <= Imm_Ext_Signal;

end Behavioral;

