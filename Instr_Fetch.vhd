----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:53 03/19/2020 
-- Design Name: 
-- Module Name:    Instr_Fetch - Behavioral 
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


entity Instr_Fetch is
port(    		
					PC_Immed : in std_logic_vector(31 downto 0);
					PC_Sel : in std_logic;
					PC_LdEn : in std_logic;
					Reset : in std_logic;
					clk : in std_logic;
					Instr_out : out std_logic_vector(31 downto 0));					
end Instr_Fetch;

architecture Behavioral of Instr_Fetch is


component Mux2to1_5bits is
 Port ( 	  In0 : in  STD_LOGIC_VECTOR (4 downto 0);
           In1 : in  STD_LOGIC_VECTOR (4 downto 0);
           SelectMux : in  STD_LOGIC;
           OutMux : out  STD_LOGIC_VECTOR (4 downto 0));
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

component IFSTAGE is
	Port (  PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end component;



signal Pc_out_signal: std_logic_vector(31 downto 0);



begin

IF_stage : IFSTAGE
	port map(   PC_Immed => PC_Immed,
					PC_Sel => PC_Sel,
					PC_LdEn => PC_LdEn,
					Reset => Reset,
					Clk => clk,
					PC => Pc_out_signal
					);
					
					
Instr_Memo: RAM
port map(
			clk=>clk,
			inst_addr => Pc_out_signal(12 downto 2),
			inst_dout => Instr_out,
			data_we => '0',
			data_addr =>"00000000000",
			data_din => "00000000000000000000000000000000" ,
			data_dout => open
			);


					




end Behavioral;

