--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:33:46 05/03/2020
-- Design Name:   
-- Module Name:   C:/Organwsi workspace/dikomou/SOURCES/ergasia1/PROC_TB.vhd
-- Project Name:  ergasia1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PROCCESSOR
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
 
ENTITY PROC_TB IS
END PROC_TB;
 
ARCHITECTURE behavior OF PROC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PROCCESSOR_MC
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PROCCESSOR_MC PORT MAP (
          Clk => Clk,
          Reset => Reset
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
      Reset<='1';
      wait for Clk_period*1;	



		Reset<='0';
      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
