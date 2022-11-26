--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:21:40 04/19/2020
-- Design Name:   
-- Module Name:   C:/Users/Matzik/Xilinx/ergasia1/IFSTAGE_TB.vhd
-- Project Name:  ergasia1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IFSTAGE
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
 
ENTITY IFSTAGE_TB IS
END IFSTAGE_TB;
 
ARCHITECTURE behavior OF IFSTAGE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IFSTAGE
    PORT(
         PC_Immed : IN  std_logic_vector(31 downto 0);
         PC_sel : IN  std_logic;
         PC_LdEn : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
	 
	 COMPONENT RAM
	 Port ( inst_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           inst_dout : out  STD_LOGIC_VECTOR (31 downto 0);
           data_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           data_we : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           data_din : in  STD_LOGIC_VECTOR (31 downto 0);
           data_dout : out  STD_LOGIC_VECTOR (31 downto 0));
	 END COMPONENT;
	 
	 
	 COMPONENT MEMSTAGE
    PORT(
         clk : IN  std_logic;
         ByteOp : IN  std_logic;
         MEM_WrEn : IN  std_logic;
         ALU_MEM_Addr : IN  std_logic_vector(31 downto 0);
         MEM_DataIn : IN  std_logic_vector(31 downto 0);
         MEM_DataOut : OUT  std_logic_vector(31 downto 0);
         MM_Addr : OUT  std_logic_vector(31 downto 0);
         MM_WrEn : OUT  std_logic;
         MM_WrData : OUT  std_logic_vector(31 downto 0);
         MM_RdData : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal PC_Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal PC_sel : std_logic := '0';
   signal PC_LdEn : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
	
	 --Ram Inputs
   signal inst_addr : std_logic_vector(10 downto 0) := (others => '0');
   signal data_we : std_logic := '0';
   signal data_addr : std_logic_vector(10 downto 0) := (others => '0');
   signal data_din : std_logic_vector(31 downto 0) := (others => '0');

 	--Ram Outputs
   signal inst_dout : std_logic_vector(31 downto 0);
   signal data_dout : std_logic_vector(31 downto 0);
	
	
	
	-- MemStage Inputs
   signal ByteOp : std_logic := '0';
   signal MEM_WrEn : std_logic := '0';
   signal ALU_MEM_Addr : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_DataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal MM_RdData : std_logic_vector(31 downto 0) := (others => '0');

 	--MemStage Outputs
   signal MEM_DataOut : std_logic_vector(31 downto 0);
   signal MM_Addr : std_logic_vector(31 downto 0);
   signal MM_WrEn : std_logic;
   signal MM_WrData : std_logic_vector(31 downto 0);


 	--Outputs
   signal PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
	
	
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   ifstageon: IFSTAGE PORT MAP (
          PC_Immed => PC_Immed,
          PC_sel => PC_sel,
          PC_LdEn => PC_LdEn,
          Reset => Reset,
          Clk => Clk,
          PC => PC
        );
	ramon: RAM PORT MAP (
          clk => clk,
          inst_addr => PC(12 downto 2),
          inst_dout => inst_dout,
          data_we => data_we,
          data_addr => ALU_MEM_Addr(10 downto 0),
          data_din => data_din,
          data_dout => data_dout
        );
		  
	memStageon: MEMSTAGE PORT MAP (
          clk => clk,
          ByteOp => ByteOp,
          MEM_WrEn => MEM_WrEn,
          ALU_MEM_Addr => ALU_MEM_Addr,
          MEM_DataIn => MEM_DataIn,
          MEM_DataOut => MEM_DataOut,
          MM_Addr => MM_Addr,
          MM_WrEn => MM_WrEn,
          MM_WrData => MM_WrData,
          MM_RdData => MM_RdData
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
		
		--reset state
		PC_LdEn <= '1';
      PC_Immed <= "00000000000000000000000000010010";
		PC_sel <= '0' ;
		Reset<= '1' ;
      wait for Clk_period;
		--non branch
		PC_LdEn <= '1';
      PC_Immed <= "00000000000000000000000000010010";
		PC_sel <= '0' ;
		Reset<= '0' ;
      wait for Clk_period;
		--branch
		PC_LdEn <= '1';
      PC_Immed <= "00000000000000000000000000000001";
		ALU_MEM_Addr <= x"00000001";
		PC_sel <= '1' ;
		Reset<= '0' ;
      wait for Clk_period; 
		PC_LdEn <= '0';
      PC_Immed <= "00000000000000000000000000011111";
		PC_sel <= '1' ;
		Reset<= '0' ;
      wait for Clk_period; 
		--non branch
		PC_LdEn <= '1';
      PC_Immed <= "00000000000000000000000000010111"; --immed shouldn't be considered
		PC_sel <= '0' ;
		Reset<= '0' ;
      wait for Clk_period; 
		--branch
		PC_LdEn <= '1';
      PC_Immed <= "00000000000000000000000000011000"; --immed shouldn't be considered
		PC_sel <= '1' ;
		Reset<= '0' ;
      wait for Clk_period;
		PC_LdEn <= '1';
      PC_Immed <= "00000000000000000000000000010111"; --immed shouldn't be considered
		PC_sel <= '1' ;
		Reset<= '0' ;
      wait for Clk_period;
		
      -- insert stimulus here 

      wait;
   end process;

END;
