library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;
 
entity mux8 is
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
end entity;
 
architecture struct of mux8 is
begin
process (d0,d1,d2,d3,d4,d5,d6,d7,sel) is
begin
	if (sel = "000") then
			dout <= d0;
		elsif (sel = "001") then
			dout <= d1;
		elsif (sel = "010") then
			dout <= d2;
		elsif (sel = "011") then
			dout <= d3;
		elsif (sel = "100") then
			dout <= d4;
		elsif (sel = "101") then
			dout <= d5;
		elsif (sel = "110") then
			dout <= d6;
		elsif (sel = "111") then
			dout <= d7;
		end if;
end process;
end struct;
