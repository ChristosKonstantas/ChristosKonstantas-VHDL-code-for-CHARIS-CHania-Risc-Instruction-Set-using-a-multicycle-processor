
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY DATAPATH_TEST IS
END DATAPATH_TEST;
 
ARCHITECTURE behavior OF DATAPATH_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATAPATH
    PORT(
           nPC_sel : in  STD_LOGIC;-- -- =0 pc+4 =1 pc+4+signExt*4
			  PC_LdEn : in STD_LOGIC;--- =1
           RegWr : in  STD_LOGIC; -- RF_Wren
           RegDst : in  STD_LOGIC;--RF_B_Sel selects rd or rt 
           ExtOp : in  STD_LOGIC_VECTOR(1 downto 0); ---- Extension Operation
           ALUSrc : in  STD_LOGIC;--selects Rf_B or Immediate
           ALUctr : in  STD_LOGIC_VECTOR(3 downto 0);--AluFunc praksh ths alu
           MemWr : in  STD_LOGIC;---- write Enable for control
           MemtoReg : in  STD_LOGIC;----RF_WrData_Sel select ALU_out or MEM_out
			  Mux_Sel_RFA : in std_logic; --select RFA or 00000 for lui li and b
			  Clk : in STD_LOGIC;
			  Reset : in STD_LOGIC;
			  Instruction : out STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal nPC_sel : std_logic := '0';
   signal PC_LdEn : std_logic := '0';
   signal RegWr : std_logic := '0';
   signal RegDst : std_logic := '0';
   signal ExtOp : std_logic_vector(1 downto 0) := (others => '0');
   signal ALUSrc : std_logic := '0';
   signal ALUctr : std_logic_vector(3 downto 0) := (others => '0');
   signal MemWr : std_logic := '0';
   signal MemtoReg : std_logic := '0';
   signal Mux_Sel_RFA : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATAPATH PORT MAP (
          nPC_sel => nPC_sel,
          PC_LdEn => PC_LdEn,
          RegWr => RegWr,
          RegDst => RegDst,
          ExtOp => ExtOp,
          ALUSrc => ALUSrc,
          ALUctr => ALUctr,
          MemWr => MemWr,
          MemtoReg => MemtoReg,
          Mux_Sel_RFA => Mux_Sel_RFA,
          Clk => Clk,
          Reset => Reset,
          Instruction => Instruction,
          Zero => Zero
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
--		Reset <= '1' ; 
--      wait for Clk_period*7;
--		----addi $r5,$r1,8-------------------
--      nPC_sel <= '0' ;
--		PC_LdEn <= '1';
--		RegWr<= '1';
--		RegDst <= '0' ; --- 0 for I-type
--		ExtOp <= "00"; --signExt(Imm)
--		ALUSrc <= '1'; -- ALU_Bin_Sel
--		ALUctr <= "0000";--add operation for alu
--		MemWr <= '0'; --doesnt do store instr
--		MemtoReg <='0'; --take ALU_out
--		Mux_Sel_RFA <= '0'; --take RF_A
--		Reset <= '0' ; 
--		
--		-- hold reset state for 100 ns.
    
		
		Reset <= '1';
		wait for clk_period*1;
		
		nPC_sel <='0'; 
		PC_LdEn <='1'; 
		Reset <= '0';
		wait for clk_period*1;
		--wait for 10 ns ;
		Reset <= '0';


		-- addi r5,r0,8
      --RF[rd] = RF[rs] + SignExtend(Imm)
		nPC_sel <='0'; 
		PC_LdEn<='1'; 
		RegWr <='1';
		MemtoReg <='0'; --Alu out 
		RegDst <='0';
		ExtOp<="00";  -- SIGN EXT
		ALUSrc <='1';  --Immed
		ALUctr <="0000"; --add			
		MemWr  <='0';
		Mux_Sel_RFA<='0';

		wait for clk_period*1;
		
		-- ori r3,r0,ABCD
   	-- RF[rd] = RF[rs] | ZeroFill(Imm)
		
		nPC_sel <='0'; 			
		PC_LdEn <='1'; 
		RegWr <='1';
		MemtoReg <='0'; --Alu out 
		RegDst  <='0';
		ExtOp<="10"; --zero fill 
		ALUSrc <='1';  --Immed
		ALUctr <="0011"; --OR			
		MemWr  <='0';
		Mux_Sel_RFA<='0';
		wait for clk_period*1;
		
		-- sw r3 4(r0)
		 --  MEM[RF[rs] + SignExtend(Imm)] <- RF[rd]
		nPC_sel <='0'; 
		PC_LdEn <='1'; 
		RegWr <='0';
		MemtoReg <='1'; --Mem out dont care
		RegDst  <='1';
		ExtOp<="00";
		ALUSrc <='1';  --Immed
		ALUctr  <="0000";	--add	
		MemWr  <='1'; 
		Mux_Sel_RFA<='0';
		wait for clk_period*1;

		-- lw r10,-4(r5)
		--RF[rd] = MEM[RF[rs] + SignExtend(Imm)]
		 
		nPC_sel <='0'; 
		PC_LdEn <='1'; 
		RegWr <='1';
		MemtoReg <='1'; --Mem out 
		RegDst  <='0';
		ExtOp<="00";
		ALUSrc <='1';  --Immed
		ALUctr  <="0000";--add		
		MemWr  <='0'; 
     Mux_Sel_RFA<='0';		
		wait for clk_period*1;
		
		-- lb r16 4(r0)
		-- RF[rd] = ZeroFill(31 downto 8) & MEM[RF[rs] +SignExtend(Imm)](7 downto 0)
		nPC_sel <='0'; 
		PC_LdEn <='1'; 
		RegWr <='1';
		MemtoReg <='1'; --Mem out 
		RegDst  <='0';
		ExtOp<="00"; 
		ALUSrc <='1';  --Immed
		ALUctr  <="0000"; --add		
		MemWr  <='0';  
		Mux_Sel_RFA<='0';
		wait for clk_period*1;
		
		-- nand r4,r0,r16
		--RF[rd] = RF[rs] NAND RF[rt]
		nPC_sel <='0'; 
		PC_LdEn <='1'; 
		RegWr <='1';
		MemtoReg <='1'; --Mem out 
		RegDst  <='1'; --rt
		ExtOp<="00"; -- dont care
		ALUSrc <='0';  --RF_B
		ALUctr  <="0000"; --nand		
		MemWr  <='0';  
		Mux_Sel_RFA<='0';

    
      wait;
		
	 

      wait;
   end process;

END;
