library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity statetable1 is

	port
	(
		clk		 			: in	std_logic;
		opcode				: in	std_logic_vector(3 downto 0);
		reset	 				: in	std_logic;
		C_bit,Z_bit	: in 	std_logic;
		carry, zero, alu1_z     : in 	std_logic;
	-- t3_mux_1, pc_en, mem_rd_bar, mem_wr_bar, ir_en, ir_demux, rf_wr, pc_mux, memA_mux_1, memA_mux_0, memD_mux, a1_mux, a2_mux, a3_mux_1, 			a3_mux_0, t1_mux_2, t1_mux_1, t1_mux_0, t2_mux, t3_mux, d3_mux_1, d3_mux_0, t4_mux, aluA_mux_1, aluA_mux_0, aluB_mux_2, 		aluB_mux_1, aluB_mux_0,s4_update_cz,s1_update_CZ, alu_op_1, alu_op_0
		control_store: out std_logic_vector(34 downto 0)
	);
	
end entity;

architecture statetable of statetable1 is
	type state_type is (s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s44, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s0,s00);
	
	signal state, next_state : state_type;

begin

theproc : process (clk, reset)
begin
	if (reset = '1') then
			state <= S1;
	elsif rising_edge(clk) then
		state <= next_state;
	end if;
end process;

control_store_decode : process (state, opcode, zero, alu1_z, carry)
begin
	-- t1_en, t2_en, t3_en, t3_mux_1, pc_en, t9_en, mem_wr_bar, ir_en, ir_demux, rf_wr, pc_mux, memA_mux_1, memA_mux_0, memD_mux, a1_mux, a2_mux, a3_mux_1, 			a3_mux_0, t1_mux_2, t1_mux_1, t1_mux_0, t2_mux, t3_mux, d3_mux_1, d3_mux_0, t4_mux, aluA_mux_1, aluA_mux_0, aluB_mux_2, 		aluB_mux_1, aluB_mux_0,c,z, alu_op_1, alu_op_0

-- default don't cares have been given 0

	if(state = s1) then
			control_store <= "00000010000000000000000000000000100";

	elsif(state = s2) then
			control_store <= "00100111000000000000001000000010000";
			
	elsif(state = s0) then		--ire=1
			control_store <= "00001011000000000000000000000000000";
	
	elsif(state = s3) then
			control_store <= "11000010000000000000100000000000000";

	elsif(state = s4) then
		if (opcode = "1100") then 	--subtract(beq)
			control_store <= "00000110000000000000001000010101010";
		elsif    (opcode = "0010") then	--nand
			control_store <= "00100110000000000000001000010101001";
		--elsif (opcode = "1100") then 	--subtract(beq)
			--control_store <= "0110000000000000000000010100010";
		else 			 	--and
			control_store <= "00100110000000000000001000010101000";
	end if; 
	elsif(state = s5) then
			control_store <= "00000010010000000000000110000000000";

	elsif(state = s6)  and (carry = '1') then
			control_store <= "00000010010000000000000110000000000";

	elsif(state = s6)  and (carry = '0') then
			control_store <= "00000010000000000000000000000000000";

	elsif(state = s7) and (zero = '1') then
			control_store <= "00000010010000000000000110000000000";

	elsif(state = s7) and (zero = '0') then
			control_store <= "00000010000000000000000000000000000";

	elsif(state = s8) then
			control_store <= "01000010000000000000010000000000000";

	elsif(state = s9) then
			control_store <= "00000010010000001000000110000000000";

	elsif(state = s10) then
			control_store <= "10000010000000000001100000000000000";

	elsif(state = s11) then
			control_store <= "00000010010000000100000000000000000";
-----------done
	elsif(state = s12) then
			control_store <= "00110010000000000000001000000000000";
	elsif(state = s44) then
			control_store <= "00000110000000000000000000100101000";
	elsif(state = s13) then
			control_store <= "10000010000110000001000000000000000";

	elsif(state = s14) then
			control_store <= "00000010010000000100000000000000000";

	elsif(state = s15) then
			control_store <= "01000010000000010000000000000000000";

	elsif(state = s16) then
			control_store <= "00000000000111000000000000000000000";

	elsif(state = s17) and (zero = '1') then
			control_store <= "00001110001000000000000000001000000";

	elsif(state = s17) and (zero = '0') then
			control_store <= "00000110000000000000000000001000000";

	elsif(state = s18) then
			control_store <= "00000110010000000100000010000000000";

	elsif(state = s19) then
			control_store <= "00001110101000000000000000001010000";

	elsif(state = s20) then
			control_store <= "00001110001000000000000000110000000";

	elsif(state = s21) then
			control_store <= "00000010000000000000000000000000100";

	elsif(state = s22) then
			control_store <= "11000010000000000000100000000000000";

	elsif(state = s23) then
			control_store <= "00110110000000000000000000000000000";

	elsif(state = s24) then
			control_store <= "00000010010010001100000100000000000";

	--elsif(state = s24) and (alu1_z = '1') then
	--		control_store <= "00000010000000000000000000000000000";

	elsif(state = s25) and (alu1_z = '0') then
			control_store <= "11000010000000000011100001100010000";

	elsif(state = s25) and (alu1_z= '1') then
			control_store <= "00000010000000000000000000000000000";

	elsif(state = s26) then
			control_store <= "00000000000010100000000000000000000";

	--elsif(state = s26) and (alu1_z = '1') then
	--		control_store <= "00000010000000000000000000000000000";	
			end if;
	end process;

next_state_decode : process (state, opcode,C_bit, Z_bit,zero,alu1_z)
begin
				if(state= s1) then 
					next_state <= s2 ;
				elsif(state= s2) then 
					next_state <= s0 ;
				elsif (state= s0) then 
					if ((opcode = "0000") or (opcode = "0001") or (opcode = "0010") or (opcode = "0100") or (opcode = "0101") or (opcode = "1100")) then
						next_state <= s3;
					elsif (opcode = "0011") then
						next_state <= s10;
					elsif ((opcode = "1000")  or (opcode = "1001")) then
						next_state <= s18;
					elsif ((opcode = "0110")  or (opcode = "0111")) then
						next_state <= s22;
					else 
						next_state <= s1; --invalid instruction go to state 1
					end if;
				elsif(state= s3) then 
					if ((opcode = "0000") or (opcode = "0010") or (opcode = "1100")) then
						next_state <= s4;
					elsif (opcode = "0001") then
						next_state <= s8;
					elsif (opcode = "0100")  or (opcode = "0101") then
						next_state <= s12;
					elsif (opcode = "1001") then
						next_state <= s20;
					else 
						next_state <= s1; --invalid instruction go to state 1
					end if;
				elsif(state= s4) then 
					if (opcode = "0001") then
						next_state <= s9;
					elsif (opcode = "1100") then
						next_state <= s21;
					elsif (((opcode = "0010") and C_bit = '1' and Z_bit = '0') or ((opcode = "0000") and C_bit = '1' and Z_bit = '0')) then
						next_state <= s6;
					elsif (((opcode = "0010") and C_bit = '0' and Z_bit = '0') or ((opcode = "0000") and C_bit = '0' and Z_bit = '0')) then
						next_state <= s5;
					elsif (((opcode = "0010") and C_bit = '0' and Z_bit = '1') or ((opcode = "0000") and C_bit = '0' and Z_bit = '1')) then
						next_state <= s7;
					else 
						next_state <= s1; --invalid instruction go to state 1
					end if;
				elsif(state= s5) then 	
					next_state <= s1;
				elsif(state= s6) then 
					next_state <= s1;
				elsif(state= s7) then 
					next_state <= s1;
				elsif(state= s8) then 
					next_state <= s4;
				elsif(state= s9) then 
					next_state <= s1;
				elsif(state= s10) then 
					next_state <= s11;
				elsif(state= s11) then 
					next_state <= s1;
				elsif(state= s12) then 
					next_state <= s44;
				elsif(state= s44) then
					if (opcode = "0101") then
						next_state <= s15;
					elsif (opcode = "0100") then
						next_state <= s13;
					end if;
				elsif(state= s13) then 
					next_state <= s14;
				elsif(state= s14) then 
					next_state <= s1;
				elsif(state= s15) then 
					next_state <= s16;
				elsif(state= s16) then
					next_state <= s1;
				elsif(state= s17) then 
					next_state <= s1;
				elsif(state= s18) then
					if (opcode = "1000") then
					next_state <= s19;
					elsif (opcode = "1001") then
					next_state <= s3;
					end if;
				elsif(state= s19) then 
					next_state <= s1;
				elsif(state= s20) then 
					next_state <= s1;
				elsif(state= s21) then 
					next_state <= s17;	
				elsif(state= s22) then 
					next_state <= s23;
				elsif(state= s23) then 
					if ((opcode = "0110")) then
						next_state <= s24;
					elsif (opcode = "0111") then
						next_state <= s26;
					else 
						next_state <= s1; --invalid instruction go to state 1
					end if;
				
				elsif(state= s24) then 
					next_state <= s25;	
				elsif(state= s25) then 
					if (alu1_z = '1') then
						next_state <= s1;
					elsif (alu1_z = '0') then
						next_state <= s23;
					else 
						next_state <= s1; --invalid instruction go to state 1
					end if;	
				elsif(state= s26) then 
					next_state <= s25;
				end if;
	end process;
end statetable; 
