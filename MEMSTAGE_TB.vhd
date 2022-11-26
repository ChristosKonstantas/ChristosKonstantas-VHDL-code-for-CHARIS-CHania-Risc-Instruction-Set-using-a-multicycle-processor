--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:59:41 04/24/2020
-- Design Name:   
-- Module Name:   C:/Organwsi workspace/neo/ergasia1/MEMSTAGE_TB.vhd
-- Project Name:  ergasia1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MEMSTAGE
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
 
ENTITY MEMSTAGE_TB IS
END MEMSTAGE_TB;
 
ARCHITECTURE behavior OF MEMSTAGE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
   signal clk : std_logic := '0';
   signal ByteOp : std_logic := '0';
   signal MEM_WrEn : std_logic := '0';
   signal ALU_MEM_Addr : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_DataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal MM_RdData : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal MEM_DataOut : std_logic_vector(31 downto 0);
   signal MM_Addr : std_logic_vector(31 downto 0);
   signal MM_WrEn : std_logic;
   signal MM_WrData : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MEMSTAGE PORT MAP (
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
     
		    ByteOp <='0';
          MEM_WrEn <='0';
          ALU_MEM_Addr <="00000000000000000000000000000000";
          MEM_DataIn   <="00001111100000000000000000000000";
          MM_RdData    <="00000000000100000010000000000000";
      wait for clk_period;

			 ByteOp <='1';
          MEM_WrEn <='1';
          ALU_MEM_Addr <="00000000000000000000000000000000";
          MEM_DataIn   <="00000000000000110000010000000001";
          MM_RdData    <="00000000001000000000000000000010";
      wait for clk_period;

			 ByteOp <='0';
          MEM_WrEn <='1';
          ALU_MEM_Addr <="00000000000000011000000000000000";
          MEM_DataIn   <="00000000000000001111100000000000";
          MM_RdData    <="00000100001000000010000000000000";
      wait for clk_period;

			 ByteOp <='1';
          MEM_WrEn <='0';
          ALU_MEM_Addr <="00000000110000011000000000000000";
          MEM_DataIn   <="00110000000000000000000000100000";
          MM_RdData    <="00000000000000000010000000000110";
      wait for clk_period;





      -- insert stimulus here 

      wait;
   end process;

END;
