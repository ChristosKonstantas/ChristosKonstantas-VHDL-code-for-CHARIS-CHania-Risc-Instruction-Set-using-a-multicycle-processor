------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date:    14:29:54 05/08/2020 
---- Design Name: 
---- Module Name:    DEC_STAGE_REG - Behavioral 
---- Project Name: 
---- Target Devices: 
---- Tool versions: 
---- Description: 
----
---- Dependencies: 
----
---- Revision: 
---- Revision 0.01 - File Created
---- Additional Comments: 
----
------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DEC_STAGE_REG is
    Port ( Clk : in STD_LOGIC;
			  Immed_In : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_A_In : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B_In : in  STD_LOGIC_VECTOR (31 downto 0);
			  rd_In : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_Out : out  STD_LOGIC_VECTOR (4 downto 0);
			  rs_Out_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  rs_Out_Out : out  STD_LOGIC_VECTOR (4 downto 0);
			  rt_Out_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  rt_Out_Out : out  STD_LOGIC_VECTOR (4 downto 0);
			  Opcode_Out_In : in  STD_LOGIC_VECTOR (5 downto 0);
			  Opcode_Out_Out : out  STD_LOGIC_VECTOR (5 downto 0);
           Immed_Out : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A_Out : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end DEC_STAGE_REG;

architecture Behavioral of DEC_STAGE_REG is

begin

	process(Clk,Immed_In,RF_A_In,RF_B_In,rd_In,rs_Out_In,rt_Out_In,Opcode_Out_In)
	begin
		if rising_edge(Clk) then
				Immed_Out <= Immed_In;
				RF_A_Out <= RF_A_In;
				RF_B_Out <= RF_B_In;
				rd_Out <= rd_In;
				rs_Out_Out <= rs_Out_In;
				rt_Out_Out <= rt_Out_In;
				Opcode_Out_Out <= Opcode_Out_In;
		end if;
	end process;

end Behavioral;


