----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:11:43 05/01/2020 
-- Design Name: 
-- Module Name:    Fetch_Unit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fetch_Unit is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           PC_sel : in  STD_LOGIC);
end Fetch_Unit;

architecture Behavioral of Fetch_Unit is

component IFSTAGE is
	Port (  PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0); ---timh immediate gia branch entoles
           PC_sel : in  STD_LOGIC;--select polyplekth gia pc+4 alliws pc+4+SignExt(Immed)*4
           PC_LdEn : in  STD_LOGIC; --energopoihsh eggrafhs ston PC
           Reset : in  STD_LOGIC; --eisodos Reset ston PC
           Clk : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component RAM is
port (
			clk : in std_logic;
			inst_addr : in std_logic_vector(10 downto 0);
			inst_dout : out std_logic_vector(31 downto 0);
			data_we : in std_logic;
			data_addr : in std_logic_vector(10 downto 0);
			data_din : in std_logic_vector(31 downto 0);
			data_dout : out std_logic_vector(31 downto 0));
end component;


signal PC_Signal : std_logic_vector(31 downto 0);

begin



If_Stage : IFSTAGE
port map ( PC_Immed => PC_Immed,
			  PC_sel => PC_sel,
			  PC_LdEn => PC_LdEn,
			  Reset => Reset,
			  Clk => Clk,
			  PC => PC_Signal
           );
			  
R_A_M : RAM
port map ( clk=>Clk,
			  inst_addr=>PC_Signal(12 downto 2),
			  inst_dout => Instruction,
			  data_we => '0',
			  data_addr => "00000000000",
			  data_din => "00000000000000000000000000000000" ,
			  data_dout =>open
			  );







end Behavioral;

