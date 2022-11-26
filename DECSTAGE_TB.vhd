
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DECSTAGE_TB IS
END DECSTAGE_TB;
 
ARCHITECTURE behavior OF DECSTAGE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECSTAGE
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         RST : IN  std_logic;
         ImmExt : IN  std_logic_vector(1 downto 0);
         Clk : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal RST : std_logic := '0';
   signal ImmExt : std_logic_vector(1 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECSTAGE PORT MAP (
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          RST => RST,
          ImmExt => ImmExt,
          Clk => Clk,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      RST <='1';
		 ImmExt<= "00" ; --signExtension
      wait for Clk_period;
			-- addi r5,r0,8
          --RF[rd] = RF[rs] + SignExtend(Imm)
         Instr <= "11000000000001010000000000001000";
         RF_WrEn <='1';
         ALU_out <="00000000000000000000000000001000";
         MEM_out <="00000000000000000000000000010010";
         RF_WrData_sel <= '0'; 
         RF_B_sel <= '1'; --0 gia immediate
			RST <= '0';
         ImmExt <="00";
			wait for Clk_period;
			-- ori r3,r0,ABCD
   	   -- RF[rd] = RF[rs] | ZeroFill(Imm)
			Instr <= "11001100000000111010101111001101";
         RF_WrEn <='1';
         ALU_out <="00000000000000001010101111001101";
         MEM_out <="00000000000000000000000000010011";
         RF_WrData_sel <= '0';
         RF_B_sel <= '1';
			RST <= '0';
         ImmExt <="10";
			wait for Clk_period;
			-- sw r3 4(r0)
		   --MEM[RF[rs] + SignExtend(Imm)] <- RF[rd]
		   Instr <= "01111100000000110000000000000100";
         RF_WrEn <='1';
         ALU_out <="00000000000000000000000000110001";
         MEM_out <="00000000000000000000000000000100";
         RF_WrData_sel <= '1';
         RF_B_sel <= '1';
			RST <= '0';
         ImmExt <="00";
			wait for Clk_period;
      wait;
   end process;

END;
