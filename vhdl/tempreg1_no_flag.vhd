library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity tempreg_alu1 is  
  port( 
	reset : in std_logic;
	din : in std_logic;  
        dout : out std_logic
);  
end entity;
  
architecture struct of tempreg_alu1 is  
  begin  
    temp1 : process (reset, din)  
      begin  
		if reset = '1' then
			dout <= '0' ;
      else  
          dout <= din;  
       end if;  
    end process temp1;  
end struct;
