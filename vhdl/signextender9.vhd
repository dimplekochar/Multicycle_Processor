library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity signextender9 is
port(
 	din 	: in STD_LOGIC_VECTOR(8 downto 0);
 	dout	: out STD_LOGIC_VECTOR(15 downto 0)
 	);
end entity;

architecture struct of signextender9 is

begin
    dout(15 downto 9) <= "0000000";
    dout(8 downto 0)  <= din;
end struct;
