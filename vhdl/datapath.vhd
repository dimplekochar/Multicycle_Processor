
-----------------------------------------------
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------
entity datapath is 
	port( control_store: in std_logic_vector(34 downto 0);
	      
	      CLK, RST: in  std_logic; 
			IR_output : out std_logic_vector(15 downto 0);
			C,Z,Z_alu1: out  std_logic
			);
end entity;

architecture behave of datapath is 
	signal PC_out,PC_in,mem_d_in,mem_d_out, ir_out,t7_out,
	rf_d1_sig, rf_d2_sig, rf_d3_sig,aluA_in, aluB_in, alu_out,t1_in,t1_out,t2_in, t2_out,t3_in, t3_out, t10_out, dummy,se6_out,se9_out,shift7_out, mem_check, t9_out   : std_logic_vector(15 downto 0);
        signal alu1_out,t4_in,t4_out,t6_in,t6_out,t8_out: std_logic_vector(7 downto 0);
        signal se9_in, shift7_in							 : std_logic_vector(8 downto 0);
	signal mem_a, r0, r1, r2, r3, r4, r5, r6, r7								 : std_logic_vector(15 downto 0);
	signal rf_a1_sig,rf_a2_sig,rf_a3_sig,t5_in, t5_out			 : std_logic_vector(2 downto 0);
        signal carry,zero, dummy_c, dummy_z, carry1, zero1, alu1_z, c_flag, z_flag					 : std_logic;
        
-------------to-do-------------------------------------------------------------------
--Demux2(check)
-------------------------------------------------------------------------------------

      

      component pc is  
 	 port(clock,reset, pc_en : in std_logic;
      	 din : in std_logic_vector(15 downto 0);  
     	  dout : out std_logic_vector(15 downto 0)
     	 );  
	end component;

      component memory is   
    	 port
  		(	
   	 rf_d1 , mem_check         	: out std_logic_vector(15 downto 0);
         rf_d3          	: in  std_logic_vector(15 downto 0);
   	 write_bar   	        : in  std_logic;
  	 read_bar   	        : in  std_logic;
  	 rf_a1   	    	: in  std_logic_vector(15 downto 0);
  	 rf_a3   	   	: in  std_logic_vector(15 downto 0);
  	 clk,reset              : in  std_logic
	 
  	 );
	end component;

     component alu is
	port(x,y: in std_logic_vector(15 downto 0);
        z: out std_logic_vector(15 downto 0);
        aluc: out std_logic;
        aluz: out std_logic;
	aluop: in std_logic_vector(1 downto 0)
		  );
	end component;

      component alu1 is
	port(x,y: in std_logic_vector(7 downto 0);
        z: out std_logic_vector(7 downto 0);
        aluc: out std_logic;
        aluz: out std_logic
		  );
	end component;


      component decoder is
     	port(
         dout 	: out std_logic_vector(7 downto 0);
         din 	: in std_logic_vector(2 downto 0)
         );
        end component;


     component ir is  
     	port(reset,ire : in std_logic;
       din : in std_logic_vector(15 downto 0);  
       dout : out std_logic_vector(15 downto 0)
      	);  
        end component;

     component demux2 is
	port(
	din : std_logic_vector(8 downto 0);
	sel: in std_logic;
	
	dout1: out std_logic_vector(8 downto 0);
	dout2: out std_logic_vector(8 downto 0)
	);
	end component;

     component mux2 is
	generic(input_width : integer);
	port(
	d0 : std_logic_vector(input_width-1 downto 0);
	d1 : std_logic_vector(input_width-1  downto 0);

  	sel: in std_logic;
	dout: out std_logic_vector(input_width-1 downto 0)
	);
	end component;


     component mux4 is
	generic(input_width : integer);
	port(
	d0 : std_logic_vector(input_width-1 downto 0);
	d1 : std_logic_vector(input_width-1 downto 0);
	d2 : std_logic_vector(input_width-1 downto 0);
	d3 : std_logic_vector(input_width-1 downto 0);

  	sel: in std_logic_vector(1 downto 0);
	dout: out std_logic_vector(input_width-1 downto 0)
	);
	end component;


     component mux8 is
	generic(input_width : integer);
	port(
	d0 : std_logic_vector(input_width-1 downto 0);
	d1 : std_logic_vector(input_width-1 downto 0);
	d2 : std_logic_vector(input_width-1 downto 0);
	d3 : std_logic_vector(input_width-1 downto 0);
	d4 : std_logic_vector(input_width-1 downto 0);
	d5 : std_logic_vector(input_width-1 downto 0);
	d6 : std_logic_vector(input_width-1 downto 0);
	d7 : std_logic_vector(input_width-1 downto 0);


  	sel: in std_logic_vector(2 downto 0);
	dout: out std_logic_vector(input_width-1 downto 0)
	);
	end component;


      component priorityencoder is
   	  port(
         din 	: in std_logic_vector(7 downto 0);
         dout 	: out std_logic_vector(2 downto 0)
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
		r0_out, r1_out, r2_out, r3_out, r5_out, r4_out, r6_out, r7_out : out std_logic_vector(15 downto 0)
 	   );
	end component;


     component shifter7 is
 	port(	din 	: in std_logic_vector(8 downto 0);
 	dout	: out std_logic_vector(15 downto 0)
 	);
	end component;


     component signextender9 is
	port(
 	din 	: in STD_LOGIC_VECTOR(8 downto 0);
 	dout	: out STD_LOGIC_VECTOR(15 downto 0)
 	);
	end component;

     component tempreg1 is  
	  port( 
	reset : in std_logic;
	din, flag_en : in std_logic;  
        dout : out std_logic
	);  
	end component;


     component tempreg3 is  
 	 port( 
	reset, en : in std_logic;
	din : in std_logic_vector(2 downto 0);  
        dout : out std_logic_vector(2 downto 0)
	);  
	end component;


     component tempreg8 is  
 	 port( 
	reset, en : in std_logic;
	din : in std_logic_vector(7 downto 0);  
        dout : out std_logic_vector(7 downto 0)
	);  
	end component;


      component tempreg16 is  
 	 port( 
	reset, en: in std_logic;
	din : in std_logic_vector(15 downto 0);  
        dout : out std_logic_vector(15 downto 0)
	);  
	end component;

      component signextender6 is
	port(
 	din 	: in std_logic_vector(5 downto 0);
 	dout	: out std_logic_vector(15 downto 0)
 	);
	end component;
	
	component tempreg_alu1 is  
  port( 
	reset : in std_logic;
	din : in std_logic;  
        dout : out std_logic
);  
end component;
  
--	pc_en, mem_rd_bar, mem_wr_bar, ir_en, ir_demux, rf_wr, pc_mux, memA_mux_1, memA_mux_0, memD_mux, a1_mux, a2_mux, a3_mux_1, 			a3_mux_0, t1_mux_2, t1_mux_1, t1_mux_0, t2_mux, t3_mux, d3_mux_1, d3_mux_0, t4_mux, aluA_mux_1, aluA_mux_0, aluB_mux_2, 		aluB_mux_1, aluB_mux_0, carry_en, zero_en, alu_op_1, alu_op_0
	
-----------------------------------------------			
begin 

pc_mux: mux2  
generic map (16)
port map(sel => control_store(24), d0 =>t3_out, d1 => alu_out, dout =>PC_in); 

memA_mux: mux4
generic map (16)
port map(sel => control_store(23 downto 22), d0 =>PC_out, d3=> t9_out, d1 => t3_out, d2 => t1_out, dout => mem_a);
 
memD_mux: mux2  
generic map (16)
port map(sel => control_store(21), d0 =>rf_d1_sig, d1 => t2_out, dout =>mem_d_in);

a1_mux: mux2  
generic map (3)
port map(sel => control_store(20), d0 =>ir_out(11 downto 9), d1 => t5_out, dout =>rf_a1_sig); 

a2_mux: mux2  
generic map (3)
port map(sel => control_store(19), d0 =>ir_out(8 downto 6), d1 => ir_out(11 downto 9) , dout =>rf_a2_sig);

a3_mux: mux4
generic map (3)
port map(sel => control_store(18 downto 17), d0 => ir_out(5 downto 3), d1 =>ir_out(11 downto 9 ), d2 => ir_out(8 downto 6 ), d3=> t5_out, dout => rf_a3_sig);

d3_mux: mux4
generic map (16)
port map(sel => control_store(11 downto 10), d0 => t1_out, d1 => t10_out, d2 => mem_d_out, d3=> t9_out, dout => rf_d3_sig);

t1_mux: mux8
generic map (16)
port map(sel => control_store(16 downto 14), d7 => alu_out, d1 => rf_d1_sig, d2 => mem_d_out, d3=> shift7_out, d4 => se6_out, d5 => t3_out, d6 => dummy, d0 => dummy , dout => t1_in);

t2_mux: mux2  
generic map (16)
port map(sel => control_store(13), d0 =>rf_d2_sig, d1 => se6_out , dout =>t2_in);

t3_mux: mux4  
generic map (16)
port map(sel(0) => control_store(12),sel(1) => control_store(31), d0 =>dummy, d1 => alu_out , d2 =>t1_out, d3 =>se6_out, dout =>t3_in);

t4_mux: mux2  
generic map (8)
port map(sel => control_store(9), d0 =>ir_out(7 downto 0), d1 => t8_out , dout =>t4_in);

aluA_mux: mux4
generic map (16)
port map(sel => control_store(8 downto 7), d0 => t10_out, d1 => t1_out, d2 => t3_out, d3=> t2_out, dout => aluA_in);

aluB_mux: mux8
generic map (16)
port map(sel => control_store(6 downto 4), d0 => "0000000000000000", d1 => "0000000000000001", d2 => t2_out, d3=> dummy, d4 => se6_out, d5 => se9_out, d6 => dummy, d7 => "0000000000000000" , dout => aluB_in);

ir_demux: demux2 
port map(din => ir_out(8 downto 0), sel => control_store(26), dout1 => shift7_in, dout2 => se9_in);
	
t1: tempreg16
port map(en => control_store(34),  reset => RST, din =>t1_in, dout =>t1_out);

t2: tempreg16
port map(en => control_store(33), reset => RST, din =>t2_in, dout =>t2_out);

t3: tempreg16
port map(en => control_store(32), reset => RST, din =>t3_in, dout =>t3_out);

t4: tempreg8
port map( reset => RST, din =>t4_in, dout =>t4_out, en => control_store(33));

t5: tempreg3
port map( reset => RST, din =>t5_in, dout =>t5_out, en => control_store(32) );

t6: tempreg8
port map( reset => RST, din =>t6_in, dout =>t6_out, en => control_store(29) );

--t7: tempreg16
--port map(en => control_store(32), reset => RST, din =>mem_d_out, dout =>t7_out);

t9: tempreg16
port map(en => control_store(29), reset => RST, din =>alu_out, dout =>t9_out);

t8: tempreg8
port map( reset => RST, din =>alu1_out, dout =>t8_out, en => control_store(32));

t10: tempreg16
port map(en => control_store(32), reset => RST, din =>pc_out, dout =>t10_out);

D: decoder
port map(din =>t5_out, dout =>t6_in);

PE: priorityencoder
port map(din =>t4_out, dout =>t5_in);

SE9: signextender9
port map(din =>se9_in, dout =>se9_out);

SE6: signextender6
port map(din =>ir_out(5 downto 0), dout =>se6_out);

s7: shifter7
port map(din =>shift7_in, dout =>shift7_out);

instr_reg: ir
port map(reset =>RST,ire =>control_store(27), din =>mem_d_out, dout =>ir_out);

reg_file: registerfile
port map(r0_out => r0, r1_out => r1, r2_out => r2, r3_out => r3, r4_out => r4, r5_out => r5, r6_out => r6, r7_out => r7, rf_d1 => rf_d1_sig,rf_d2 => rf_d2_sig, rf_d3 => rf_d3_sig, rf_a1 => rf_a1_sig, rf_a2 => rf_a2_sig, rf_a3 => rf_a3_sig, clk => CLK, reset => RST,write1 =>control_store(25));

carry_reg: tempreg1
port map(reset =>RST, din =>carry, flag_en => control_store(3), dout => carry1);

zero_reg: tempreg1
port map(reset =>RST,din => zero, flag_en => control_store(3), dout => zero1);

c_reg: tempreg1
port map(reset =>RST, din =>carry1, flag_en => control_store(2), dout => c_flag);

z_reg: tempreg1
port map(reset =>RST,din => zero1, flag_en => control_store(2), dout => z_flag);

zero1_reg: tempreg_alu1
port map(reset =>RST,din => dummy_z, dout => alu1_z);

alu_16: alu
port map(x =>aluA_in , y=>aluB_in, z =>alu_out, aluc =>carry, aluz =>zero, aluop =>control_store(1 downto 0));

alu_8: alu1
port map(x => t4_out, y => t6_out, z => alu1_out, aluc =>dummy_c, aluz =>dummy_z );
	
Prog_counter : pc
port map(clock => CLK, reset => RST, pc_en => control_store(30), din => pc_in, dout => pc_out);  

MEM: memory
port map( mem_check => mem_check, rf_d1 => mem_d_out, rf_d3 => mem_d_in, write_bar => control_store(28), read_bar => control_store(29),  rf_a1 => mem_a, rf_a3 => mem_a, clk => CLK, reset => RST);

------------------------------------------------------------

C <= c_flag;
Z <= z_flag;
Z_alu1<=alu1_z;
IR_output <= ir_out;



end behave;
