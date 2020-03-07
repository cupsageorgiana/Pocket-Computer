library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity impartire is 
	port( numar1:in std_logic_vector(7 downto 0); 
	numar2:in std_logic_vector(7 downto 0);
	rezultat:out std_logic_vector(7 downto 0));
end impartire;

architecture arh_impartire of impartire is 

begin 
	process(numar1, numar2)	
	variable i:integer;
	variable var:std_logic_vector(6 downto 0);
	variable cat:std_logic_vector(7 downto 0); 
	variable rez:std_logic_vector(7 downto 0);
	
	begin	
		   	
		cat:="00000000";	  
		if (numar2(6 downto 0)/="0000000") then
		var:="0000000";
		var:=var+numar1(6 downto 0);
		
		for i in 1 to 128 loop 
			if (var>=numar2(6 downto 0)) then 
				var:=var-numar2(6 downto 0);
				cat(6 downto 0):=cat(6 downto 0)+1;
			else exit;
			end if;
			end loop;
			rez(6 downto 0):=cat(6 downto 0);
		else 
			rez:="00000000";
		end if;			   
		rezultat(6 downto 0)<=rez(6 downto 0);
			
		if (numar1(7)='0') then 
			if (numar2(7)='1') then 
				rezultat(7)<='1';
			else 
				rezultat(7)<='0';
			end if;			 
			end if;
			if (numar1(7)='1') then 
				if (numar2(7)='0') then 
					rezultat(7)<='1';
				else 
					rezultat(7)<='0';
				end if;
				end if;	 
				end process;
		end arh_impartire;
		