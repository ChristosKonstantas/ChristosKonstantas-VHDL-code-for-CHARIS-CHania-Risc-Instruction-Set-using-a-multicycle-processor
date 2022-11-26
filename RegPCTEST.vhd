--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:18:18 04/23/2020
-- Design Name:   
-- Module Name:   C:/Users/Matzik/Xilinx/ergasia1/RegPCTEST.vhd
-- Project Name:  ergasia1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC_Register
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
 
ENTITY RegPCTEST IS
END RegPCTEST;
 
ARCHITECTURE behavior OF RegPCTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC_Register
    PORT(
         Data_in : IN  std_logic_vector(31 downto 0);
         LdEn : IN  std_logic;
         clk : IN  std_logic;
         Reset : IN  std_logic;
         Data_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal LdEn : std_logic := '0';
   signal clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Data_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC_Register PORT MAP (
          Data_in => Data_in,
          LdEn => LdEn,
          clk => clk,
          Reset => Reset,
          Data_out => Data_out
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

      --reset state 
		Data_in<="10101010101010101010101010101010";
		LdEn<='1';
		Reset<='1';
      wait for clk_period;
		Data_in<="11111010101010101010101010101010";
		LdEn<='1';
		Reset<='0';
      wait for clk_period;
		Data_in<="10101010101010101010101011111111";
		LdEn<='1';
		Reset<='0';
		wait for clk_period;
		Data_in<="11101010100000001110101111111111";
		LdEn<='1';
		Reset<='0';
		wait for clk_period;
		Data_in<="11100000000000001110101111100000";
		LdEn<='0';
		Reset<='0';
      wait;
   end process;

END;
