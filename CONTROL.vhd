--------CONTROL---------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROL_MC is
     Port( nPC_sel : OUT STD_LOGIC;-- -- =0 pc+4 =1 pc+4+signExt*4
			  PC_LdEn : OUT STD_LOGIC;--- =1
           RegWr : OUT  STD_LOGIC; -- RegWr
           RegDst : OUT  STD_LOGIC;--RegDst  selects rd or rt '0
           ExtOp : OUT  STD_LOGIC_VECTOR(1 downto 0); ---- Extension Operation
           ALUSrc : OUT  STD_LOGIC;--selects Rf_B or Immediate
           ALUctr : OUT  STD_LOGIC_VECTOR(3 downto 0);--AluFunc praksh ths alu
           MemWr : OUT  STD_LOGIC;---- write Enable for control
           MemtoReg : OUT  STD_LOGIC;---- select ALU_out or MEM_out
			  Byte_Op_Signal : OUT std_logic;
			  MEM_WrEN : OUT std_logic; ---write enable gia memory
			  Mux_Sel_RFA : OUT std_logic; --select RFA or 00000 for lui li and b
			  Clk : IN STD_LOGIC;
			  Reset : IN STD_LOGIC;
			  Instruction : IN STD_LOGIC_VECTOR (31 downto 0);
           Zero : IN  STD_LOGIC);
end CONTROL_MC;

architecture Behavioral of CONTROL_MC is

type fsm_state is (Init,Rtype,Itype,B1,B2,B3,Idle,Beq,Bneq,LoadStuff,StoreStuff,Zero0,Zero1);
signal state : fsm_state;

begin
	
	fsm_process : process
	begin
		wait until(Clk'event and Clk ='1');
		
		if Reset = '1' then
			state <= Init;
			nPC_sel<='0';
			PC_LdEn<='0';
			ALUSrc<='0';
			ALUctr<="0000";
			RegWr<='0';
			MemtoReg <='0';
			RegDst <='0';
			Byte_Op_Signal<='0';
			MemWr<='0';
			MEM_WrEN<='0';
			Mux_Sel_RFA<='0';
			ExtOp<="00";
		else	
		
			case state is 
				when Init=>     --initial state 
					case Instruction(31 downto 26) is
						--goto Rtype state
						when "100000" =>
							state <= Rtype;
							RegWr<='1';
							MemWr<='0';
							MEM_WrEN<='0';
							RegDst  <= '0';     --protos typos entolis dialekse rs
							ALUSrc<='0';    --dialekse to RF_B
							MemtoReg<='0'; -- dialekse ALU_out
							Mux_Sel_RFA<='0';
							ALUctr<=Instruction(3 downto 0);
							PC_LdEn<='1';
							
						--goto Itype state
						when "111000" =>    --li
							state <= Itype;
							RegWr<='1';          --grapse sto RF
							MemWr<='0';
							MEM_WrEN<='0';
							RegDst  <= '1';  -- deuteros typos entolis dialekse rt
							ALUSrc<='1';     --dialekse to Immed
							Mux_Sel_RFA<='1';   --dialekse na prostheseis midenika
							ALUctr<="0000";   --prosthese
							PC_LdEn<='1';
							ExtOp<="00"; --SignExt(Imm)
							
						when"111001" =>    --lui
							state <= Itype;
							RegWr<='1';    --grapse sto RF
							RegDst  <= '1'; --dialekse rt
							MemWr<='0';
							MEM_WrEN<='0';
							ALUSrc<='1';     --dialekse to Immed
							Mux_Sel_RFA<='1';   --dialekse na prostheseis midenika
							ALUctr<="0000";   --prosthese
							PC_LdEn<='1';
							ExtOp<="11";	--zeroFill(Imm)<<16

						when "110000" =>  --addi
							state <= Itype;
							RegDst  <= '1';
							ALUSrc<='1';     --dialekse to Immed
							MemWr<='0';
							MEM_WrEN<='0';
							Mux_Sel_RFA<='0';   --dialekse rfa
							RegWr<='1';          --grapse sto RF
							ALUctr<= "0000";   --dialekse ti func tha kaneis
							PC_LdEn<='1';
							ExtOp<="00";	--SignExt(Imm)
							
						when "110010" =>  --nandi
							state <= Itype;
							RegWr<='1';    --grapse sto RF
							RegDst  <= '1';  --dialekse rt
							ALUSrc<='1';     --dialekse to Immed
							MemWr<='0';
							MEM_WrEN<='0';
							Mux_Sel_RFA<='0';   --dialekse rfa
							ALUctr<="0101";   --dialekse ti func tha kaneis
							PC_LdEn<='1';
							ExtOp<="10";  --zeroFill(Imm)
							
						when "110011" =>  -- ori
							state <= Itype;
							RegWr<='1';          --grapse sto RF
							RegDst  <= '1';  --dialekse rt
							ALUSrc<='1';     --dialekse to Immed
							MemWr<='0';
							MEM_WrEN<='0';
							Mux_Sel_RFA<='0';   --dialekse rfa
							ALUctr<="0011";   --dialekse ti func tha kaneis
							PC_LdEn<='1';
							ExtOp<="10";  --zeroFill(Imm)
						
						--goto Branch
						when "111111" =>  --b
							state <= B1;
							PC_LdEn<='1';
							nPC_sel<='1';  
							
						--goto Branch Equal
						when "000000"=>  --beq
							state<=Beq;
							RegDst <='1'; --rt
							ALUSrc<='0'; --rfb
							ALUctr<="0001";
							
						
						--goto Branch not Equal
						when "000001"=>   --bneq
							state<=Bneq;
							RegDst <='1';
							ALUSrc<='0';
							ALUctr<="0001";
							
						--goto Load Byte
						when "000011"=>
							state<=LoadStuff;
							ALUctr<="0000";
							MemWr<='0';
							RegWr<='1';
							MemtoReg<='1';
							MEM_WrEN<='0';
							ALUSrc<='1';
							PC_LdEn<='1';
							Byte_Op_Signal<='1';
							ExtOp<="00";
							RegDst <='1';
							
						--goto Store Byte
						when "000111"=>
							state<=StoreStuff;
							ALUctr<="0000";
							ALUSrc<='1';
							MemtoReg<='0';
							RegDst <='1';
							RegWr<='0';
							MemWr<='1';
							MEM_WrEn<='1';
							PC_LdEn<='1';
							Byte_Op_Signal<='1';
							ExtOp<="00";
							
						
						--goto Load Word
						when "001111"=>
							state<=LoadStuff;
							ALUctr<="0000";
							ALUSrc<='1';
							MemWr<='0';
							RegWr<='1';
							RegDst <='1';
							MemtoReg<='1';
							MEM_WrEN<='0';
							PC_LdEn<='1';
							Byte_Op_Signal<='0';
							ExtOp<="00";
				
						--goto Store Word
						when "011111"=>
							state<=StoreStuff;
							ALUctr<="0000";
							ALUSrc<='1';
							RegDst <='1';
							MEM_WrEn<='1';
							MemtoReg<='0';
							MemWr<='1';
							RegWr<='0';
							PC_LdEn<='1';
							Byte_Op_Signal<='0';
							ExtOp<="00";
						
						when others =>
							state<=Init;
							PC_LdEn<='1';
					end case;
				
				
				when Rtype=>    --Rtype state
					state<=Idle;
					MemtoReg <='0';    --dialekse ALU out
					RegWr<='1';          --grapse sto RF
					RegDst  <= '0';    -- R-type
					MEM_WrEn<='0';
					Byte_Op_Signal<='0';
					PC_LdEn<='0'; 
					ALUSrc<='0';  --dialekse RF_B 					
					
				when Itype=>      --Itype state
					MemtoReg <='0';    --dialekse ALU out
					RegWr<='0';          
					state<=Idle;
					RegDst  <= '1'; --I-type
					PC_LdEn<='0'; 
					ALUSrc<='1';     --dialekse to Immediate
				
				when B1=>      --Branch state
					state<=B2;
					PC_LdEn<='0';
					nPC_sel<='0';       --dialekse na kaneis branch
					
				when B2=>
					state<=Init;
					PC_LdEn<='0';
					
				when Beq=>
					if Zero='1' then
						state <= B1;
						PC_LdEn<='1';
						nPC_sel<='1'; 
					else
						PC_LdEn<='1';
						state <= B1;
						nPC_sel<='0'; 
					end if;
				
				when Bneq=>
					if Zero='0' then
						state <= B1;
						PC_LdEn<='1';
						nPC_sel<='1'; 
					else
						PC_LdEn<='1';
						state <= B1;
						nPC_sel<='0'; 
					end if;
					
				when LoadStuff=>
					state<=Idle;
					MemtoReg <='1';
					RegWr<='1';
					PC_LdEn<='0';
					--Byte_Op_Signal<='0';
					ALUSrc<='0';     --dialekse to RF_B
					ExtOp<="00";
					RegDst <='1';
					
				when StoreStuff=>
					state<=Idle;
					PC_LdEn<='0';
					ALUSrc<='1';     --dialekse to SignExt(Imm)
					MEM_WrEn<='0';
					RegWr<='0';
					MemWr<='0';
					MemtoReg <='0';
					ExtOp<="00";
					RegDst <='1';
					--Byte_Op_Signal<='0';
				
				when Idle=>     --Idle state
					state<=Init;
					RegWr<='0'; 
					MemtoReg <='0';
					Mux_Sel_RFA<='0';
					Byte_Op_Signal<='0';
					nPC_sel<='0';   --epanefere ton PC sosta
					
					
				when others=>
					state<=Init;
			end case;
	end if;
	end process;
end Behavioral;


