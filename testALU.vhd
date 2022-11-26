


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
ENTITY testALU IS
END testALU;
ARCHITECTURE behavior OF testALU IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic;
         Cout : OUT  std_logic;
         Ovf : OUT  std_logic
        );
    END COMPONENT;
   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');
 	--Outputs
   signal Output : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Op => Op,
          Output => Output,
          Zero => Zero,
          Cout => Cout,
          Ovf => Ovf
        );
  -- Stimulus process
   stim_proc: process
   begin		
      -- apli prosthesi
		A<="00011111111111111111111111111111";
		B<="00000000000000000000000000000111";
		Op<="0000";
      wait for 100 ns;	
		-- add with Cout
		A<="11011001000000000000000000000000";
		B<="01011100000000000000000000000000";
		Op<="0000";
      wait for 100 ns;	
		-- add with Ovf case 1		
		A<="01100000000000000000000000000000";
		B<="00100000000000000000000000000000";
		Op<="0000";
      wait for 100 ns;	
		-- add with Ovf case 2 and Cout		
		A<="10011111111111101111111111111111";
		B<="10100000000000000000000000000001";
		Op<="0000";
      wait for 100 ns;	
		-- add with outpt zero 	
		A<="11111000000000000000000000000000";
		B<="00001000000000000000000000000000";
		Op<="0000";
      wait for 100 ns;	
      -- apli prosthesi
		A<="00011111111111111111111001111111";
		B<="00000000000000000000000000100111";
		Op<="0000";
      wait for 200 ns;	
		      -- apli afairesi
		A<="00011111111111111111111111111111";
		B<="00000000000000000000000000000111";
		Op<="0001";
      wait for 100 ns;	
		-- sub with Cout
		A<="10011111111111101111111111111111";
		B<="10100000000000000000000000000001";
		Op<="0001";	
		wait for 100 ns;
		-- sub with Ovf case and Cout	
		A<="01110000000000000000000000000000";
		B<="10100000000000000000000000000000";
		Op<="0001";
      wait for 100 ns;	
		-- sub with Ovf case 2		
		A<="10110000000000000000000000000000";
		B<="01110000000000000000000000000000";
		Op<="0001";
      wait for 100 ns;	
		-- sub with outpt zero 	
		A<="11111000000000000000000000000000";
		B<="11111000000000000000000000000000";
		Op<="0001";
      wait for 100 ns;	
      -- apli afairesi
		A<="11110000000000000000000000000000";
		B<="00000000000000000000000000000010";
		Op<="0001";
      wait for 200 ns;
      -- A nand B
		A<="11110000010000100001000000000000";
		B<="00000000010000100001000000000010";
		Op<="0010";
      wait for 200 ns;
      -- A or B
		A<="11110000000000000000000000000000";
		B<="00100000000000000000000000000010";
		Op<="0011";
      wait for 200 ns;
      -- not(A)
		A<="11110000000000000000000000000000";
		B<="00000000000000000000000000000010";
		Op<="0100";
      wait for 200 ns;
      -- arithmitiki olisthisi deksia(epanalambanetai msb)
		A<="10110000000000000000000000000000";
		B<="00000000000000000000000000000010";
		Op<="1000";
      wait for 200 ns;
      -- logiki olisthisi deksia(msb 0)
		A<="11110000000000000000000000000000";
		B<="00000000000000000000000000000010";
		Op<="1001";
      wait for 200 ns;
      -- logiki olisthisi aristera(lsb 0)
		A<="11110000000000000000000000000001";
		B<="00000000000000000000000000000010";
		Op<="1010";
      wait for 200 ns;
      -- kukliki olisthisi aristera
		A<="11110000000000000000000000000010";
		B<="00000000000000000000000000000010";
		Op<="1100";
      wait for 200 ns;
      -- kukliki olisthisi deksia
		A<="11110000000000000000000000000000";
		B<="00000000000000000000000000000010";
		Op<="1101";
      wait for 200 ns;
--
--      wait for <clock>_period*10;
      -- insert stimulus here 
      wait;
   end process;
END;