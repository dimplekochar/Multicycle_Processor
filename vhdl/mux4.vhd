library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;
 
entity mux4 is
generic(input_width : integer);
port(
	d0 : std_logic_vector(input_width-1 downto 0);
	d1 : std_logic_vector(input_width-1 downto 0);
	d2 : std_logic_vector(input_width-1 downto 0);
	d3 : std_logic_vector(input_width-1 downto 0);

  	sel: in std_logic_vector(1 downto 0);
	dout: out std_logic_vector(input_width-1 downto 0)
);
end entity;
 
architecture struct of mux4 is
begin
process (d0,d1,d2,d3,sel) is
begin
		if (sel = "00") then
			dout <= d0;
		elsif (sel = "01") then
			dout <= d1;
		elsif (sel = "10") then
			dout <= d2;
		elsif (sel = "11") then
			dout <= d3;
		end if;
end process;
end struct;
