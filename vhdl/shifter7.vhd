library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity shifter7 is
 port(	din 	: in std_logic_vector(8 downto 0);
 	dout	: out std_logic_vector(15 downto 0)
 	);
end entity;

architecture struct of shifter7 is

begin
    dout(15 downto 7) <= din;
    dout(6 downto 0)  <= "0000000";
end struct;
