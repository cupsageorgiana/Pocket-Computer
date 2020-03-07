library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity multiplexor is 
	port (adunare:in std_logic_vector(7 downto 0);
	scadere:in std_logic_Vector(7 downto 0);
	inmultire:in std_logic_vector(7 downto 0);
	impartire:in std_logic_vector(7 downto 0);
	selectie:in std_logic_Vector(1 downto 0);
	enable:in std_logic;
	iesire:out std_logic_Vector(7 downto 0));
end multiplexor;  

architecture arh_multiplexor of multiplexor is 	 

begin 			  
	process(selectie, enable)
	begin
	if enable='0' then
		iesire<="00000000";
	elsif enable='1' then
		
		case selectie is 
			
			when "00" => iesire<=adunare;
			when "01" => iesire<=scadere;
			when "10" => iesire<=inmultire;
			when "11" => iesire<=impartire;	 
			when others => null;
			
		end case;
	end if;
	end process;
	end arh_multiplexor;
		

