--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:11:13 03/25/2020
-- Design Name:   
-- Module Name:   C:/Users/Matzik/Xilinx/ergasia1/RF_Test.vhd
-- Project Name:  ergasia1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile
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
 
ENTITY RF_Test IS
END RF_Test;
 
ARCHITECTURE behavior OF RF_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         Ard1 : IN  std_logic_vector(4 downto 0);
         Ard2 : IN  std_logic_vector(4 downto 0);
         Awr : IN  std_logic_vector(4 downto 0);
         Din : IN  std_logic_vector(31 downto 0);
         WrEn : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Dout1 : OUT  std_logic_vector(31 downto 0);
         Dout2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ard1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Ard2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal WrEn : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(31 downto 0);
   signal Dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          Ard1 => Ard1,
          Ard2 => Ard2,
          Awr => Awr,
          Din => Din,
          WrEn => WrEn,
          Reset => Reset,
          Clk => Clk,
          Dout1 => Dout1,
          Dout2 => Dout2
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
		Reset <='1';
	   Ard1 <= "00000";
      Ard2 <= "00000";
      Awr <=  "00001";
      Din <= "10000100000000000000001100000000";
      WrEn <= '1';
		wait for Clk_period;
		
		 -- hold reset state for 100 ns.
		Reset <='0';
	   Ard1 <= "00000";
      Ard2 <= "00000";
      Awr <=  "00001";
      Din <= "10000100000000000000001100000000";
      WrEn <= '1';
		wait for Clk_period;
		Reset <='0';
      Ard1 <= "00001";
      Ard2 <= "00010";
      Awr <=  "00000";
      Din <= "00000000000000000000001100000000";
      WrEn <= '1';
		wait for Clk_period;	
		
		Ard1 <= "11001";
      Ard2 <= "00010";
      Awr <=  "00010";
      Din <= "11111000000000000000001100000000";
      WrEn <= '1';
		wait for Clk_period;
		
		Ard1 <= "00001";
      Ard2 <= "00010";
      Awr <=  "00000";
      Din <= "00000000000000000000001100000000";
      WrEn <= '1';
		wait for Clk_period;
		
		Ard1 <= "00001";
      Ard2 <= "10010";
      Awr <=  "00001";
      Din <= "11000000000000111100001100000000";
      WrEn <= '0';
		wait for Clk_period;
		
		Ard1 <= "00001";
      Ard2 <= "00010";
      Awr <=  "00010";
      Din <= "00000000000000000000001100000000";
      WrEn <= '0';
		wait for Clk_period;
				
		Ard1 <= "11111";
      Ard2 <= "00010";
      Awr <=  "10110";
      Din <= "00000000000000000000001100000000";
      WrEn <= '1';
		wait for Clk_period;
		
		Ard1 <= "00001";
      Ard2 <= "00010";
      Awr <=  "00000";
      Din <= "00000000000000000000001100000000";
      WrEn <= '0';
		wait for Clk_period;
		
		Ard1 <= "00001";
      Ard2 <= "11111";
      Awr <=  "11111";
      Din <= "00000000000000000000001100000000";
      WrEn <= '1';
		wait for Clk_period;
		
		Ard1 <= "00001";
      Ard2 <= "11111";
      Awr <=  "00000";
      Din <= "00000000000000000000001100000000";
      WrEn <= '0';
		wait for Clk_period;
		
		Ard1 <= "00001";
      Ard2 <= "11111";
      Awr <=  "00000";
      Din <= "00000000000000000000001100000000";
      WrEn <= '1';
		wait for Clk_period;


      wait;
   end process;

END;
