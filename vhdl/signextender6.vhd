library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity signextender6 is
port(
 	din 	: in std_logic_vector(5 downto 0);
 	dout	: out std_logic_vector(15 downto 0)
 	);
end entity;

architecture struct of signextender6 is

begin
    dout(15 downto 6) <= "0000000000";
    dout(5 downto 0)  <= din;
end struct;
