
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DECSTAGE is
port(  Instr : in std_logic_vector(31 downto 0);
		 RF_WrEn: in std_logic;
		 ALU_out : in std_logic_vector(31 downto 0); --
		 MEM_out : in std_logic_vector(31 downto 0); --
		 RF_WrData_sel: in std_logic; -- select ALUout or MEMout
		 RF_B_sel: in std_logic; --select RF_B or Immediate
		 RST : in std_logic;
		 ImmExt	: in std_logic_vector(1 downto 0);
		 Clk		:in std_logic;
		 rd_Out : out  STD_LOGIC_VECTOR (4 downto 0);
		 rs_Out : out  STD_LOGIC_VECTOR (4 downto 0);
		 rt_Out : out  STD_LOGIC_VECTOR (4 downto 0);
		 Opcode_Out : out  STD_LOGIC_VECTOR (5 downto 0);
		 Immed	:out std_logic_vector(31 downto 0);
		 RF_A		:out std_logic_vector(31 downto 0);
		 RF_B		:out std_logic_vector(31 downto 0)
		);
end DECSTAGE;



architecture Behavioral of DECSTAGE is

component RegisterFile is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);   --dieuthinsi 1reg
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC);
end component;

component Mux2to1_5bits is
 Port (    In0 : in  STD_LOGIC_VECTOR (4 downto 0);
           In1 : in  STD_LOGIC_VECTOR (4 downto 0);
           SelectMux : in  STD_LOGIC;
           OutMux : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Mux2to1_32bits is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           SelectMux : in  STD_LOGIC;
           OutMux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Extender is
		Port (Immed : in std_logic_vector(15 downto 0);
				Ext_Out : out std_logic_vector(31 downto 0);
				Imm_Ext : in std_logic_vector(1 downto 0)
				);
end component;





signal muxOut32,Immed_In_Sig,RF_A_In_Sig,RF_B_In_Sig: std_logic_vector(31 downto 0);
signal muxOut5: std_logic_vector(4 downto 0);
signal ImmExtSig: std_logic_vector(1 downto 0);

begin


MUX2TO1_32 : Mux2to1_32bits --select stage ALU or Memory
port map ( In0 => ALU_out, --write from ALU_out
           In1 => MEM_out, --write from memory
           SelectMux => RF_WrData_sel, 
           OutMux => muxOut32
			  );
			  
RF : RegisterFile
port map(  Ard1 => Instr(25 downto 21), --rs
           Ard2=>muxOut5, --rt
			  Awr=>Instr(20 downto 16),	--rd
           Dout1 => RF_A,					--busA	
           Dout2 => RF_B,					--busB
           Din => muxOut32,            --ALU_out or MEM_out
			  Reset => RST,
           WrEn => RF_WrEn,            --Declare in Control Unit RF_WrEn
           Clk => Clk
         );

MUX2TO1_5 : Mux2to1_5bits --select rt or rd 0 for Rtype 1 for Itype
port map ( In0 => Instr(15 downto 11), --rt
           In1 => Instr(20 downto 16), --rs
           SelectMux => RF_B_sel, --select if we want the I-type format or R-type
           OutMux => muxOut5
			  );
			  
EXTE : Extender
	port map( Immed => Instr(15 downto 0), --immed
				 Ext_Out => Immed,				--immediate extended
				 Imm_Ext => ImmExt
				);








end Behavioral;

