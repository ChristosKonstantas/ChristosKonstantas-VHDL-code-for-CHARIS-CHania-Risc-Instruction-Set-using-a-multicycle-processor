LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY EXSTAGE_TB IS
END EXSTAGE_TB;
 
ARCHITECTURE behavior OF EXSTAGE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EXSTAGE
    PORT(
         RF_A : IN  std_logic_vector(31 downto 0);
         RF_B : IN  std_logic_vector(31 downto 0);
         Immed : IN  std_logic_vector(31 downto 0);
         ALU_Bin_sel : IN  std_logic;
			Mux_Sel_RFA : in STD_LOGIC; --select RF_A or x00000000
         ALU_func : IN  std_logic_vector(3 downto 0);
         ALU_out : OUT  std_logic_vector(31 downto 0);
         ALU_zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
	signal Mux_Sel_RFA : std_logic := '0';
   signal RF_A : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_B : std_logic_vector(31 downto 0) := (others => '0');
   signal Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Bin_sel : std_logic := '0';
   signal ALU_func : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_out : std_logic_vector(31 downto 0);
   signal ALU_zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EXSTAGE PORT MAP (
          RF_A => RF_A,
          RF_B => RF_B,
          Immed => Immed,
          ALU_Bin_sel => ALU_Bin_sel,
          ALU_func => ALU_func,
          ALU_out => ALU_out,
			 Mux_Sel_RFA=>'0',
          ALU_zero => ALU_zero
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
          RF_A <= x"00000000";
          RF_B<= x"00000001";
          Immed <= x"00010000";
          ALU_Bin_sel <= '1';
          ALU_func <= "0000"; --addi operation of alu
      wait for 100 ns;	
		    RF_A <= x"00000001";
          RF_B<= x"00000001";
          Immed <= x"00010000";
          ALU_Bin_sel <= '1';
          ALU_func <= "0001"; --subi operation of alu
      wait for 100 ns;	
			 RF_A <= x"00000001";
          RF_B<= x"00000001";
          Immed <= x"00010000";
          ALU_Bin_sel <= '0';
          ALU_func <= "0010"; --and operation of alu
			 wait for 100 ns;	
			 RF_A <= x"00000101";
          RF_B<= x"00000001";
          Immed <= x"00010000";
          ALU_Bin_sel <= '0';
          ALU_func <= "0110"; --nand operation of alu

     

      -- insert stimulus here 

      wait;
   end process;

END;
