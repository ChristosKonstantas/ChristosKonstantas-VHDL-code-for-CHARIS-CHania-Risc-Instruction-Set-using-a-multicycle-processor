
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EXSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALU_Bin_sel : in  STD_LOGIC; --select RF_B or Immed
			  Mux_Sel_RFA : in STD_LOGIC; --select RF_A or x00000000
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0); --function opcode
			  ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ALU_zero : out  STD_LOGIC);--zero flag for branch
end EXSTAGE;

architecture Behavioral of EXSTAGE is

signal muxOut : STD_LOGIC_VECTOR(31 downto 0);

component Mux2to1_32bits
	port(   In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           SelectMux : in  STD_LOGIC;
           OutMux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component ALU
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

component branchMux2to1 is
    Port ( in0 : in  STD_LOGIC_VECTOR(31 downto 0);
           in1 : in  STD_LOGIC_VECTOR(31 downto 0) ;
			  selectMux : in std_logic;
           output : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

COMPONENT Mux4to1
	Port (  in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in2 : in  STD_LOGIC_VECTOR (31 downto 0);
           in3 : in  STD_LOGIC_VECTOR (31 downto 0);
           in4 : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           outpt : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;



signal mux_out_sig: std_logic_vector(31 downto 0);
signal ZeroOut_In_Sig : std_logic;


begin

   branchMux : branchMux2to1
	port map( in0=> RF_A,
				 in1=> x"00000000",
				 output => muxOut,
				 selectMux => Mux_Sel_RFA);
				 
	MUX2_1 : Mux2to1_32bits
	port map( In0=>RF_B,
             In1=>Immed,
			    SelectMux=>ALU_Bin_sel,
             OutMux=>mux_out_sig);
			  
	Alu_component : ALU
	port map( A=>RF_A,
             B=>mux_out_sig,
             Op=> ALU_func,
             Output=>ALU_Out,
			    Zero => ALU_zero);
				 




end Behavioral;

