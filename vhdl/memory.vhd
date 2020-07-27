library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;
entity memory is   
    port
    (
    rf_d1, mem_check          	: out std_logic_vector(15 downto 0);
    rf_d3          	: in  std_logic_vector(15 downto 0);
    write_bar   	        : in  std_logic;
    read_bar   	        : in  std_logic;
    rf_a1   	    : in  std_logic_vector(15 downto 0);
    rf_a3   	    : in  std_logic_vector(15 downto 0);
    clk,reset             : in  std_logic
    );
end entity;

architecture struct of memory is
type memoryloc is array(0 to 31) of std_logic_vector(15 downto 0); --65536 16-bit registers
signal mem : memoryloc := (others => "0000000000000000");
begin

    mem1: process(clk,write_bar,read_bar,reset)
    begin
			if (reset = '1') then
			mem <= (others => "0000000000000000");
			--mem(0) <= "0000000000000000";
			mem(8) <= "0000000001010001"; --adz
			mem(9) <= "0000011100101000"; --add
			mem(10) <= "0000110111001010"; --adc
			mem(11) <= "0010000001010001"; --ndz
			mem(12) <= "0010011100101000"; --ndd
			mem(20) <= "0010110111001010"; --ndc
			mem(21) <= "0001011100100110"; --adi
			mem(22) <= "0011011100100110"; --lhi
			mem(23) <= "0100000001010010"; --lw
--mem(1) <= "0101010011000111"; --sw
	--mem(2) <= "0100000001001100"; --lw
		mem(0) <= "0110000010011011"; --lm
		mem(1) <= "0111010010101001"; --sm
		--	mem(6) <= "1001011100000000"; --jlr
		--	mem(2) <="1100000000000001"; --beq
		
		--	mem(7) <= "0111101000101010"; --sm
			--mem(2) <= "0110100000001010"; --lm
			--mem(9) <= "0000000000000000"; --nop
			--mem(5) <= "1001001010000000";
			--mem(12) <= "1100011100000011";
			--mem(15) <= "1100101110000100";
			--mem(16) <= "0000011100101000";
			elsif rising_edge(clk) and (write_bar = '0') then 
				mem(to_integer(unsigned(rf_a3))) <= rf_d3;
			end if;
			


--mem(0) <= "0000000001101000";
--mem(2) <= "0000010011100010";
--mem(4) <= "0000000001110001";
--mem(8) <= "0001011111010010";


    end process;
	
	rf_d1 <= mem(to_integer(unsigned(rf_a1)));
	mem_check<= mem(to_integer(unsigned(rf_a3)));

end struct;
