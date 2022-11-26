
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;





entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal result : STD_LOGIC_VECTOR (31 downto 0) ;

begin



--for signed-arithmetic operations we have to take the 2's complement to see the unsigned-logical result
result<= (A+B) when Op="0000" else
			 (A-B) when Op="0001" else
			 (A and B) when Op="0010" else
			 (A or B) when Op="0011" else
			 (not A) when Op="0100" else
			 (A and not B) when Op="0110" else
			  std_logic_vector(SHIFT_RIGHT(signed(A),1))  when Op="1000" else --arithmetic shift right
			  std_logic_vector(SHIFT_RIGHT(unsigned(A),1)) when Op="1001" else -- logical shift right 
			  std_logic_vector(SHIFT_LEFT(unsigned(A),1))when Op="1010" else -- logical shift left 
			  std_logic_vector(ROTATE_LEFT(signed(A),1)) when Op="1100" else -- cyclical shift left
			  std_logic_vector(ROTATE_RIGHT(signed(A),1)) when Op="1101" else --cyclical shift right			  
			 result;
Output<=result after 5 ns  ;


Zero<='1' when result=0 else '0';

--Ovf truth table comes out of the expressions below...--
--Ovf for ADD and SUB conditions--
process(Op,Result,A,B)
	begin
		if Op = "0000" then
			if (A(31)='0' and B(31)='0' and  Result(31)='1') or (A(31)='1' and B(31)='1' and result(31)='0') then
				Ovf<='1';
			else
				Ovf<='0';
			end if;	
		elsif Op = "0001" then
			if (A(31)='0' and B(31)='1' and Result(31)='1') or (A(31)='1' and B(31)='0' and result(31)='0')  then
					Ovf<= '1';
			else 
					Ovf<= '0';
			end if;
		else
			Ovf<='0';
		end if;
	end process;


	
---only arithmetic operations can have overflow---
---We have the 32-bit machine addressing limitation on the CPU, unless double-words or extra bits are used. Computer hardware address organization needs 32 bits--
--This is the reason why whe do not check Ovf condition for arithmetic shift and arithmetic rotate operations.--



end Behavioral;

