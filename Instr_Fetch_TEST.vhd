--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:26:58 03/19/2020
-- Design Name:   
-- Module Name:   C:/Organwsi workspace/ergasia1/Instr_Fetch_TEST.vhd
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
 
ENTITY Instr_Fetch_TEST IS
END Instr_Fetch_TEST;
 
ARCHITECTURE behavior OF Instr_Fetch_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Instr_Fetch
    PORT(
         PC_Immed : IN  std_logic_vector(31 downto 0);
         PC_Sel : IN  std_logic;
         PC_LdEn : IN  std_logic;
         Reset : IN  std_logic;
         clk : IN  std_logic;
         Instr_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal PC_Sel : std_logic := '0';
   signal PC_LdEn : std_logic := '0';
   signal Reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Instr_out : std_logic_vector(31 downto 0);

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
          Instr_out => Instr_out
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
          PC_Immed <= "00000000000000000000000000000000" ;
          PC_Sel <= '0';
          PC_LdEn <= '0';
          Reset <= '1';
      wait for clk_period*2;
			 PC_Immed <= "00000000000000000000000000001111" ;
          PC_Sel <= '1';
          PC_LdEn <= '1';
          Reset <= '0';
      wait for clk_period*2;	
		    PC_Immed <= "00000000000000000000000000001100" ;
          PC_Sel <= '0';
          PC_LdEn <= '1';
          Reset <= '0';
      wait for clk_period*2;
			 PC_Immed <= "10000000000000000000000000001000" ;
          PC_Sel <= '1';
          PC_LdEn <= '1';
          Reset <= '0';
      wait for clk_period*2;
			 PC_Immed <= "00000000000000000000000000011001" ;
          PC_Sel <= '0';
          PC_LdEn <= '1';
          Reset <= '0';
      wait for clk_period*2;
		    PC_Immed <= "00000000000000000000000000011001" ;
          PC_Sel <= '1';
          PC_LdEn <= '1';
          Reset <= '0';
      wait for clk_period*2;

      -- insert stimulus here 

      wait;
   end process;

END;
