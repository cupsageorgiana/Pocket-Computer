library ieee;
use ieee.std_logic_1164.all;

entity demultiplexor is 
	port(intrare:in std_logic_vector(7 downto 0);
	numar1:out std_logic_vector(7 downto 0);
	numar2:out std_logic_vector(7 downto 0);
	selectie:in std_logic;
	enable:in std_logic);
end demultiplexor;

architecture arh_demultiplexor of demultiplexor is 	  
begin 
	process(selectie,enable)	
	variable nr1,nr2:std_logic_vector(7 downto 0);
	
	begin 
	 if enable='1' then 
		 if selectie='0' then 
		nr1:="00000000";
		nr2:="00000000";  
		else 
			numar1<=nr1;
			numar2<=nr2;
		end if;	
		end if;
		if enable='0' then 
			if selectie='0' then 
				nr1:=intrare;
			else
				nr2:=intrare;
			end if;
			end if;	
			numar1<=nr1;
			numar2<=nr2;
			end process;
					
	end arh_demultiplexor;
	
		