library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
package lab is
	component alu1 is
	port(x,y: in std_logic_vector(7 downto 0);
        z: out std_logic_vector(7 downto 0);
        aluc: out std_logic;
        aluz: out std_logic
		  );
	end component;
	component add is
	port (x, y, i: in std_logic; z, o: out std_logic);
  	 end component;
  	 component mux is
	port (x, y, s: in std_logic; z : out std_logic);
	end component;	
	component adder8 is
	port(x,y : in std_logic_vector(7 downto 0);
z : out std_logic_vector(7 downto 0);
aluc, aluz: out std_logic);
	end component;
	component subtracter8 is
	port(x,y : in std_logic_vector(7 downto 0);
z : out std_logic_vector(7 downto 0);
aluc, aluz: out std_logic);
	end component;
end lab;



library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;
entity add is
	port (x, y, i: in std_logic; z, o: out std_logic);
end entity add;
architecture Behave of add is
begin
  z <= ((x and (not(y)) and (not(i))) or (y and (not(x)) and (not(i)))
  or (i and (not(x)) and (not(y))) or (x and y and i));
  o <= ((x and y) or (y and i) or (x and i));
end Behave;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;
entity mux0 is
  port (x, y, s: in std_logic;
         z: out std_logic);
end entity mux0;
architecture Behave of mux0 is
begin
  z <= ((x and s) or (y and (not(s))));
end Behave;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;
use work.lab.all;
entity adder8 is
port(x,y : in std_logic_vector(7 downto 0);
z : out std_logic_vector(7 downto 0);
aluc, aluz: out std_logic);
end entity;
architecture behave of adder8 is
signal c, t: std_logic_vector(7 downto 0);
begin
a0 : add port map (x => x(0), y => y(0) , i=>'0' ,z=>t(0), o=>c(0));
a1 : add port map (x => x(1), y => y(1) , i=>c(0) ,z=>t(1), o=>c(1));
a2 : add port map (x => x(2), y => y(2) , i=>c(1) ,z=>t(2), o=>c(2));
a3 : add port map (x => x(3), y => y(3) , i=>c(2) ,z=>t(3), o=>c(3));
a4 : add port map (x => x(4), y => y(4) , i=>c(3) ,z=>t(4), o=>c(4));
a5 : add port map (x => x(5), y => y(5) , i=>c(4) ,z=>t(5), o=>c(5));
a6 : add port map (x => x(6), y => y(6) , i=>c(5) ,z=>t(6), o=>c(6));
a7 : add port map (x => x(7), y => y(7) , i=>c(6) ,z=>t(7), o=>c(7));
aluc <= c(7);
z <= t;
 alu1: process(x,y,t)
    begin
			
			if (t = "00000000") then 
				aluz <= '1';
			else
				aluz <= '0';
			end if ;

    end process;
end behave;


library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;
use work.lab.all;
entity subtracter8 is
port(x,y : in std_logic_vector(7 downto 0);
z : out std_logic_vector(7 downto 0);
aluc, aluz: out std_logic);
end entity;
architecture behave of subtracter8 is
signal yc, ycc: std_logic_vector(7 downto 0);
signal c1, t1 : std_logic;
begin
yc(0) <= not(y(0));
yc(1) <= not(y(1));
yc(2) <= not(y(2));
yc(3) <= not(y(3));
yc(4) <= not(y(4));
yc(5) <= not(y(5));
yc(6) <= not(y(6));
yc(7) <= not(y(7));
a1 : adder8 port map (x => yc, y => "00000001" , z => ycc, aluc => c1, aluz => t1 );
a2 : adder8 port map (x => x, y => ycc , z => z, aluc => aluc, aluz => aluz );
end behave;


library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;
use work.lab.all;
entity alu1 is
   port(x,y: in std_logic_vector(7 downto 0);
        z: out std_logic_vector(7 downto 0);
        aluc: out std_logic;
        aluz: out std_logic
		  );
end entity;
 
architecture struct of alu1 is

begin
subtractereight : subtracter8 port map (x => x, y => y, z => z, aluc => aluc, aluz => aluz);
	  
end struct;