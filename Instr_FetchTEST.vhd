--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:22:28 03/19/2020
-- Design Name:   
-- Module Name:   C:/Organwsi workspace/ergasia1/Instr_FetchTEST.vhd
-- Project Name:  ergasia1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Instr_Fetch
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
 
ENTITY Instr_FetchTEST IS
END Instr_FetchTEST;
 
ARCHITECTURE behavior OF Instr_FetchTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Instr_Fetch
    PORT(
         PC_Immed : IN  std_logic_vector(31 downto 0);
         PC_Sel : IN  std_logic;
         PC_LdEn : IN  std_logic;
         Reset : IN  std_logic;
         clk : IN  std_logic;
         Mem_WrEn : IN  std_logic;
         PC_instr_out : OUT  std_logic_vector(31 downto 0);
         ALU_MEM_Addr : IN  std_logic_vector(31 downto 0);
         MEM_DataIn : IN  std_logic_vector(31 downto 0);
         MEM_DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal PC_Sel : std_logic := '0';
   signal PC_LdEn : std_logic := '0';
   signal Reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal Mem_WrEn : std_logic := '0';
   signal ALU_MEM_Addr : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_DataIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PC_instr_out : std_logic_vector(31 downto 0);
   signal MEM_DataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Instr_Fetch PORT MAP (
          PC_Immed => PC_Immed,
          PC_Sel => PC_Sel,
          PC_LdEn => PC_LdEn,
          Reset => Reset,
          clk => clk,
          Mem_WrEn => Mem_WrEn,
          PC_instr_out => PC_instr_out,
          ALU_MEM_Addr => ALU_MEM_Addr,
          MEM_DataIn => MEM_DataIn,
          MEM_DataOut => MEM_DataOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
