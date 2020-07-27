-----------------------------------------------
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------

entity RISC is 
	port( instruction	: out	std_logic_vector(15 downto 0);
	      CLK, RST: in  std_logic;
			clk_50s : in std_logic;
			control : out std_logic_vector(34 downto 0)
			--r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out : out	std_logic_vector(15 downto 0)
			);
end entity;


architecture behave of RISC is
	signal control_signal : std_logic_vector(34 downto 0);
	signal carry, zero, alu1_z, rst1 : std_logic;
	signal r0_out1, r1_out1, r2_out1, r3_out1, r4_out1, r5_out1, r6_out1, r7_out1, IR : std_logic_vector(15 downto 0);	
	signal mem_data_check: std_logic_vector(15 downto 0);
	signal dummy_add_rf : std_logic_vector(2 downto 0);
	signal dummy_d0_rfd1, dummy_d0_rfd2, dummy_d0_rfd3 : std_logic_vector(15 downto 0); 
-----------------------------------------------
   component datapath is 
	port( control_store : in std_logic_vector(34 downto 0);
	      CLK, RST: in  std_logic;
	      C,Z,Z_alu1     : out std_logic;
			IR_output: out std_logic_vector(15 downto 0));
	end component;
	
	component memory is   
    port
    (
    rf_d1, mem_check          	: out std_logic_vector(15 downto 0);
    rf_d3          	: in  std_logic_vector(15 downto 0);
    write_bar   	        : in  std_logic;
    read_bar   	        : in  std_logic;
    rf_a1   	    : in  std_logic_vector(15 downto 0);
    rf_a3   	    : in  std_logic_vector(15 downto 0);
    clk,reset             : in  std_logic
    );
end component;

component registerfile is   
    port
    (
    rf_d1          	: out std_logic_vector(15 downto 0);
    rf_d2          	: out std_logic_vector(15 downto 0);
    rf_d3          	: in  std_logic_vector(15 downto 0);
    write1   	        : in  std_logic;
    rf_a1   	    : in  std_logic_vector(2 downto 0);
    rf_a2	    : in  std_logic_vector(2 downto 0);
    rf_a3   	    : in  std_logic_vector(2 downto 0);
    clk,reset             : in  std_logic;
	 r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out : out std_logic_vector(15 downto 0)
    );
end component;

      component statetable1 is
	port

	(	
	clk, alu1_z		 			: in	std_logic;
		opcode				: in	std_logic_vector(3 downto 0);
		reset	 				: in	std_logic;
		C_bit,Z_bit	: in 	std_logic;
		carry, zero     : in 	std_logic;
		control_store: out std_logic_vector(34 downto 0));
	end component;
-----------------------------------------------

begin 

--R0 : registerfile 
--port map(rf_d1 => dummy_d0_rfd1, rf_d2 => dummy_d0_rfd2, rf_d3 => dummy_d0_rfd3, write1 => '0', rf_a1 => dummy_add_rf,rf_a2 => dummy_add_rf,rf_a3 => dummy_add_rf, clk => CLK,reset => RST,          
--	 r1_out => r1_out1, r2_out => r2_out1, r3_out => r3_out1, r4_out => r4_out1, r5_out => r5_out1, r6_out => r6_out1, r7_out => r7_out1, r0_out => r0_out1);

--	 r1_out <= r1_out1;
--	 r2_out <= r2_out1;
--	 r3_out <= r3_out1;
--	 r4_out <= r4_out1;
--	 r5_out <= r5_out1; 
--	 r6_out <= r6_out1; 
--	 r7_out <= r7_out1;
--	 r0_out <= r0_out1;
	 rst1 <= not(RST);
fsm: statetable1
port map(clk => CLK, opcode => IR(15 downto 12), reset => rst1, C_bit => IR(1), Z_bit => IR(0),
		carry => carry, zero => zero, control_store => control_signal, alu1_z => alu1_z);
		
		control <= control_signal;
		instruction <= IR;

total_flow: datapath 
port map(IR_output => IR, control_store => control_signal, CLK => CLK, RST=> rst1, C => carry, Z => zero, Z_alu1 => alu1_z );
-----------------------------------------------	



end behave;

