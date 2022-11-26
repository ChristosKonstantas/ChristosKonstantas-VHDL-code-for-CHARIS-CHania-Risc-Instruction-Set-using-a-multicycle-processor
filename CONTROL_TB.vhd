
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY CONTROL_TB IS
END CONTROL_TB;
 
ARCHITECTURE behavior OF CONTROL_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL_MC
    PORT(
         nPC_sel : OUT  std_logic;
         PC_LdEn : OUT  std_logic;
         RegWr : OUT  std_logic;
         RegDst : OUT  std_logic;
         ExtOp : OUT  std_logic_vector(1 downto 0);
         ALUSrc : OUT  std_logic;
         ALUctr : OUT  std_logic_vector(3 downto 0);
         MemWr : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         Byte_Op_Signal : OUT  std_logic;
         MEM_WrEN : OUT  std_logic;
         Mux_Sel_RFA : OUT  std_logic;
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Instruction : IN  std_logic_vector(31 downto 0);
         Zero : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Instruction : std_logic_vector(31 downto 0) := (others => '0');
   signal Zero : std_logic := '0';

 	--Outputs
   signal nPC_sel : std_logic;
   signal PC_LdEn : std_logic;
   signal RegWr : std_logic;
   signal RegDst : std_logic;
   signal ExtOp : std_logic_vector(1 downto 0);
   signal ALUSrc : std_logic;
   signal ALUctr : std_logic_vector(3 downto 0);
   signal MemWr : std_logic;
   signal MemtoReg : std_logic;
   signal Byte_Op_Signal : std_logic;
   signal MEM_WrEN : std_logic;
   signal Mux_Sel_RFA : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL_MC PORT MAP (
          nPC_sel => nPC_sel,
          PC_LdEn => PC_LdEn,
          RegWr => RegWr,
          RegDst => RegDst,
          ExtOp => ExtOp,
          ALUSrc => ALUSrc,
          ALUctr => ALUctr,
          MemWr => MemWr,
          MemtoReg => MemtoReg,
          Byte_Op_Signal => Byte_Op_Signal,
          MEM_WrEN => MEM_WrEN,
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
      -- hold reset state for 100 ns.
     	

--      wait for Clk_period*10;

      -- insert stimulus here 
		
		Reset <= '1';
		 wait for 20 ns;
		--Rtype 
		 Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "110000";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		 
		 
		 Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "111010";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		 
		 Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "111100";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		 
		 Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "111101";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		 
		 Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "110001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		 
		 Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "110010";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		 
		 Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "110011";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "110100";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "110101";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "110110";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "111000";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "100000" & "00011" & "00001" & "00010" & "00000" & "111001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		
		Instruction <= "111000" & "00011" & "00001" & "0001000000001001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		
		Instruction <= "111001" & "00011" & "00001" & "0000000001001001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "110000" & "00011" & "00001" & "0000000000000001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "110010" & "00011" & "00001" & "0001000000000001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "110011" & "00011" & "00001" & "0000000000100001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "111111" & "00011" & "00001" & "0001000000011001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "000000" & "00011" & "00001" & "0001000000001001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "000001" & "00011" & "00001" & "0001000000001001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "000011" & "00011" & "00001" & "0001000000001001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "000111" & "00011" & "00001" & "0001000000001001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		Instruction <= "001111" & "00011" & "00001" & "0001000000001001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		
		 Instruction <= "011111" & "00011" & "00001" & "0001000000001001";
       Zero <= '0';
       Reset <= '0';
		 wait for 20 ns;
		

       Reset <= '1';
		 wait for 20 ns;
		
		
   end process;

END;