--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:22:41 05/03/2020
-- Design Name:   
-- Module Name:   C:/Organwsi workspace/SOURCES/ergasia1/DATAPATH_TB.vhd
-- Project Name:  ergasia1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATAPATH
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DATAPATH_TB IS
END DATAPATH_TB;
 
ARCHITECTURE behavior OF DATAPATH_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATAPATH_MC
    PORT(
         nPC_sel : IN  std_logic;
         PC_LdEn : IN  std_logic;
         RegWr : IN  std_logic;
         RegDst : IN  std_logic;
         ExtOp : IN  std_logic_vector(1 downto 0);
         ALUSrc : IN  std_logic;
         ALUctr : IN  std_logic_vector(3 downto 0);
         MemWr : IN  std_logic;
         Byte_Op_Signal : IN  std_logic;
         MemtoReg : IN  std_logic;
         Mux_Sel_RFA : IN  std_logic;
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Instruction_Signal : IN  std_logic_vector(31 downto 0);
         MM_RdData : IN  std_logic_vector(31 downto 0);
         PC_Signal : OUT  std_logic_vector(31 downto 0);
         MM_Addr : OUT  std_logic_vector(31 downto 0);
         MM_WrEn : OUT  std_logic;
         MM_WrData : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic
        );
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
   signal Byte_Op_Signal : std_logic := '0';
   signal MemtoReg : std_logic := '0';
   signal Mux_Sel_RFA : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Instruction_Signal : std_logic_vector(31 downto 0) := (others => '0');
   signal MM_RdData : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PC_Signal : std_logic_vector(31 downto 0);
   signal MM_Addr : std_logic_vector(31 downto 0);
   signal MM_WrEn : std_logic;
   signal MM_WrData : std_logic_vector(31 downto 0);
   signal Zero : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATAPATH_MC PORT MAP (
          nPC_sel => nPC_sel,
          PC_LdEn => PC_LdEn,
          RegWr => RegWr,
          RegDst => RegDst,
          ExtOp => ExtOp,
          ALUSrc => ALUSrc,
          ALUctr => ALUctr,
          MemWr => MemWr,
          Byte_Op_Signal => Byte_Op_Signal,
          MemtoReg => MemtoReg,
          Mux_Sel_RFA => Mux_Sel_RFA,
          Clk => Clk,
          Reset => Reset,
          Instruction_Signal => Instruction_Signal,
          MM_RdData => MM_RdData,
          PC_Signal => PC_Signal,
          MM_Addr => MM_Addr,
          MM_WrEn => MM_WrEn,
          MM_WrData => MM_WrData,
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
		Instruction_Signal<="11000000101000000000000000001000";
		Byte_Op_Signal<='0';
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
		Instruction_Signal<="11001100011000001010101111001101";
		Byte_Op_Signal<='0';
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
		Instruction_Signal<="01111100000000110000000000000100";
		Byte_Op_Signal<='0'; 
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
		Instruction_Signal<="00111100101010101111111111111100";
		Byte_Op_Signal<='0'; 
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
		Instruction_Signal<="00001100000100000000000000000100";
		Byte_Op_Signal<='1';
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
		Instruction_Signal<="10000001010001001000000000110010";
		Byte_Op_Signal<='0';
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
