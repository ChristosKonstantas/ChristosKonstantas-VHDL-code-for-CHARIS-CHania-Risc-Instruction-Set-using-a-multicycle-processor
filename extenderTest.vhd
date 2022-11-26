--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:30:21 04/26/2020
-- Design Name:   
-- Module Name:   C:/Users/Matzik/Xilinx/ergasia1/extenderTest.vhd
-- Project Name:  ergasia1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Extender
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
 
ENTITY extenderTest IS
END extenderTest;
 
ARCHITECTURE behavior OF extenderTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Extender
    PORT(
         Immed : IN  std_logic_vector(15 downto 0);
         Ext_Out : OUT  std_logic_vector(31 downto 0);
         Imm_Ext : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Immed : std_logic_vector(15 downto 0) := (others => '0');
   signal Imm_Ext : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Ext_Out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Extender PORT MAP (
          Immed => Immed,
          Ext_Out => Ext_Out,
          Imm_Ext => Imm_Ext
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
    
	      Immed <=x"1001";
         Imm_Ext <="00";
      wait for 100 ns;	
		   Immed <=x"1001";
         Imm_Ext <="01";
      wait for 100 ns;
		  Immed <=x"1001";
         Imm_Ext <="10";
      wait for 100 ns;
		   Immed <=x"1001";
         Imm_Ext <="11";
      wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
