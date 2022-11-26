
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity IFSTAGE is
	Port (  PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0); ---timh immediate gia branch entoles
           PC_sel : in  STD_LOGIC;--select polyplekth gia pc+4 alliws pc+4+SignExt(Immed)*4
           PC_LdEn : in  STD_LOGIC; --energopoihsh eggrafhs ston PC
           Reset : in  STD_LOGIC; --eisodos Reset ston PC
           Clk : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end IFSTAGE;

architecture Behavioral of IFSTAGE is

component Mux2to1_32bits
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  SelectMux : in STD_LOGIC;
           OutMux : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component PC_Register 
	  Port ( Din : in std_logic_vector(31 downto 0);
			   LdEn : in std_logic;
			   clk : in std_logic;
			   Reset : in std_logic;
			   Dout : out std_logic_vector(31 downto 0)
			   );
end component;



signal In0_mux,In1_mux,PC_out,mux_out,PC_SignExt_Immed : STD_LOGIC_VECTOR (31 downto 0);

begin
process(Clk)
begin
   --Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed(15)&Immed
	PC_SignExt_Immed <= std_logic_vector(SHIFT_LEFT(signed(PC_Immed),2)); --sla the PC_Immed 2 times
	In0_mux<=PC_out+"00000000000000000000000000000100" ;  --- the box with the +4
	In1_mux<=PC_out+"00000000000000000000000000000100"+PC_SignExt_Immed ; --the box with the +PC_Immed +4
end process;	
	
	
	
	PCreg : PC_Register
	port map(
				Din=>mux_out,
				LdEn=>PC_LdEn,
				Clk=>Clk,
				Reset=>Reset,
				Dout=>PC_out);
				
				
				
	MUX2_1 : Mux2to1_32bits
	port map(
				In0=>In0_mux,
				In1=>In1_mux,
				SelectMux=>PC_sel,
				OutMux=>mux_out);
	
				
    PC<=PC_out;	

	

end Behavioral;

