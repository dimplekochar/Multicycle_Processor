library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity tempreg1 is  
  port( 
	reset : in std_logic;
	din, flag_en : in std_logic;  
        dout : out std_logic
);  
end entity;
  
architecture struct of tempreg1 is  
  begin  
    temp1 : process (reset, din, flag_en)  
      begin  
		if reset = '1' then
			dout <= '0' ;
      elsif  (flag_en = '1') then  
          dout <= din;  
       end if;  
    end process temp1;  
end struct;
