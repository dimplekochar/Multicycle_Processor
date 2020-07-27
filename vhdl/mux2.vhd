library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity mux2 is
generic(input_width : integer);
port(
	d0 : std_logic_vector(input_width-1 downto 0);
	d1 : std_logic_vector(input_width-1  downto 0);

  	sel: in std_logic;
	dout: out std_logic_vector(input_width-1 downto 0)
);
end entity;
 
architecture struct of mux2 is
begin
process (d0,d1,sel) is
begin
	if(sel = '0') then
			dout <= d0;
	elsif(sel = '1') then
			dout <= d1;
		end if;
end process;
end struct;
