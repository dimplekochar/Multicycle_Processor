library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity demux2 is
port(
	din : std_logic_vector(8 downto 0);
	sel: in std_logic;
	
	dout1: out std_logic_vector(8 downto 0);
	dout2: out std_logic_vector(8 downto 0)
);
end entity;
 
architecture struct of demux2 is
begin
process (din,sel) is
begin
	if(sel = '0') then
			dout1 <= din;
			dout2 <= "000000000";
	elsif(sel = '1') then
			dout2 <= din;
			dout1 <= "000000000" ;
		end if;
end process;
end struct;
