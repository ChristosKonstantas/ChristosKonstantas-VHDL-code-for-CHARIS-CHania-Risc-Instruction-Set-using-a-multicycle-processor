--------DATAPATH--------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DATAPATH_MC is
    Port ( nPC_sel : in  STD_LOGIC;-- -- =0 pc+4 =1 pc+4+signExt*4
			  PC_LdEn : in STD_LOGIC;--- =1
           RegWr : in  STD_LOGIC; -- RF_Wren
           RegDst : in  STD_LOGIC;--RF_B_Sel selects rd or rt 
           ExtOp : in  STD_LOGIC_VECTOR(1 downto 0); ---- Extension Operation
           ALUSrc : in  STD_LOGIC;--selects Rf_B or Immediate
           ALUctr : in  STD_LOGIC_VECTOR(3 downto 0);--AluFunc praksh ths alu
           MemWr : in  STD_LOGIC;---- write Enable for control
           Byte_Op_Signal : in std_logic;
			  MemtoReg : in  STD_LOGIC;----RF_WrData_Sel select ALU_out or MEM_out
			  Mux_Sel_RFA : in std_logic; --select RFA or 00000 for lui li and b
			  Clk : in STD_LOGIC;
			  Reset : in STD_LOGIC;
			  Instruction_Signal : in std_logic_vector (31 downto 0);
			  MM_RdData : in std_logic_vector(31 downto 0);
			  PC_Signal : out std_logic_vector (31 downto 0);
			  MM_Addr : out std_logic_vector (31 downto 0);
			  MM_WrEn : out std_logic;
			  MM_WrData : out std_logic_vector (31 downto 0);
           Zero : out  STD_LOGIC);
end DATAPATH_MC;



architecture Behavioral of DATAPATH_MC is


component DECSTAGE is
port(  Instr : in std_logic_vector(31 downto 0);
		 RF_WrEn: in std_logic;
		 ALU_out : in std_logic_vector(31 downto 0); --
		 MEM_out : in std_logic_vector(31 downto 0); --
		 RF_WrData_sel: in std_logic;
		 RF_B_sel: in std_logic;
		 RST : in std_logic;
		 ImmExt	: in std_logic_vector(1 downto 0);
		 Clk		:in std_logic;
		 Immed	:out std_logic_vector(31 downto 0);
		 RF_A		:out std_logic_vector(31 downto 0);
		 RF_B		:out std_logic_vector(31 downto 0)
		);
end component;

component EXSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC; --select RF_B or Immed
           Mux_Sel_RFA : in  STD_LOGIC;
			  ALU_func : in  STD_LOGIC_VECTOR (3 downto 0); --function opcode
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ALU_zero : out  STD_LOGIC);--zero flag for branch
end component;


component IFSTAGE is
	Port (  PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0); ---timh immediate gia branch entoles
           PC_sel : in  STD_LOGIC;--select polyplekth gia pc+4 alliws pc+4+SignExt(Immed)*4
           PC_LdEn : in  STD_LOGIC; --energopoihsh eggrafhs ston PC
           Reset : in  STD_LOGIC; --eisodos Reset ston PC
           Clk : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component MEMSTAGE is
    Port ( clk : in std_logic;
			  ByteOp : in  STD_LOGIC;
           MEM_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0);
           MM_Addr : out  STD_LOGIC_VECTOR (31 downto 0);
           MM_WrEn : out  STD_LOGIC;
           MM_WrData : out  STD_LOGIC_VECTOR (31 downto 0);
           MM_RdData : in  STD_LOGIC_VECTOR (31 downto 0));
end component;





signal Immediate_Sig ,MEM_out_Sig,RF_A_sig,ALU_out_Sig, RF_B_sig : std_logic_vector (31 downto 0);


begin

If_Stage : IFSTAGE
port map ( PC_Immed => Immediate_Sig,
			  PC_sel => nPC_sel,
			  PC_LdEn => PC_LdEn,
			  Reset => Reset,
			  Clk => Clk,
			  PC => PC_Signal
           );
			  

			  
Decode_Stage : DECSTAGE
port map ( Instr => Instruction_Signal,
			  RF_WrEn => RegWr,
			  ALU_out => ALU_out_Sig,
			  MEM_out => MEM_out_Sig,
			  RF_WrData_sel => MemtoReg,
			  RF_B_sel => RegDst, --RF_B_sel gia epilogh immediate h RF_B
			  RST => Reset,
			  ImmExt => ExtOp ,
			  Clk => Clk,
			  Immed => Immediate_Sig,
			  RF_A => RF_A_sig,
			  RF_B => RF_B_sig
		     );


			  
Execute_Stage : EXSTAGE
port map ( RF_A=>RF_A_sig ,
           RF_B=>RF_B_sig ,
           Immed=> Immediate_Sig,
           ALU_Bin_sel=> ALUSrc ,
			  Mux_Sel_RFA =>  Mux_Sel_RFA ,
           ALU_func=>ALUctr  ,
           ALU_out=>ALU_out_Sig ,
           ALU_zero=> Zero
			  );
			  
			  
			  
MEM_STAGE : MEMSTAGE 
Port map(  clk=>Clk ,
			  ByteOp=> Byte_Op_Signal ,
           MEM_WrEn=>MemWr ,
           ALU_MEM_Addr=>ALU_out_Sig ,
           MEM_DataIn=>RF_B_sig ,
           MEM_DataOut=>MEM_out_Sig,
           MM_Addr=>MM_Addr,
           MM_WrEn=>MM_WrEn ,
           MM_WrData=>MM_WrData ,
           MM_RdData => MM_RdData
			  );
			  
	  
			  
end Behavioral;