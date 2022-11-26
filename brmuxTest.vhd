--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:40:02 04/21/2020
-- Design Name:   
-- Module Name:   C:/Users/Matzik/Xilinx/ergasia1/brmuxTest.vhd
-- Project Name:  ergasia1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: branchMux2to1
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
 
ENTITY brmuxTest IS
END brmuxTest;
 
ARCHITECTURE behavior OF brmuxTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT branchMux2to1
    PORT(
         in0 : IN  std_logic_vector(31 downto 0);
         in1 : IN  std_logic_vector(31 downto 0);
         selectMux : IN  std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(31 downto 0) := (others => '0');
   signal in1 : std_logic_vector(31 downto 0) := (others => '0');
   signal selectMux : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: branchMux2to1 PORT MAP (
          in0 => in0,
          in1 => in1,
          selectMux => selectMux,
          output => output
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      
		in0 <= x"00000000";
		in1 <= x"00000001";
		selectMux <= '0';
      wait for 100 ns;
		in0 <= x"00000000";
		in1 <= x"00000001";
		selectMux <= '1';		

 

      wait;
   end process;

END;
