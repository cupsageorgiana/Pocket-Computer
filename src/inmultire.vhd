library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity inmultire is 
	port(								  
	numar1:in std_logic_vector(7 downto 0);
	numar2:in std_logic_vector(7 downto 0);	
	rezultat:out std_logic_vector(7 downto 0));		 
end inmultire;	

architecture arh_inmultire of inmultire is 	  
begin 									  

	process(numar1, numar2)	 
	variable produs0, produs1, produs2, produs3, produs4, produs5, produs6:std_logic_vector(7 downto 0);
	begin 	
	produs0:="00000000";	   
	produs1:="00000000";
	produs2:="00000000";
	produs3:="00000000"; 
	produs4:="00000000";
	produs5:="00000000";
	produs6:="00000000";		
	
		produs0(0):=numar2(0) and numar1(0); produs0(1):=numar2(0) and numar1(1); produs0(2):= numar2(0) and numar1(2);
		produs0(3):=numar2(0) and numar1(3); produs0(4):=numar2(0) and numar1(4); produs0(5):= numar2(0) and numar1(6);
		produs0(6):=numar2(0) and numar1(6);
		
		produs1(1):=numar2(1) and numar1(0); produs1(2):=numar2(1) and numar1(1); produs1(3):=numar2(1) and numar1(2);
		produs1(4):=numar2(1) and numar1(3); produs1(5):=numar2(1) and numar1(4); produs1(6):=numar2(1) and numar1(5);
		produs1(7):=numar2(1) and numar1(6);
																							
		produs2(2):=numar2(2) and numar1(0); produs2(3):=numar2(2) and numar1(1); produs2(4):=numar2(2) and numar1(2);
		produs2(5):=numar2(2) and numar1(3); produs2(6):=numar2(2) and numar1(4); produs2(7):=numar2(2) and numar1(5);
		   
		
		produs3(3):=numar2(3) and numar1(0); produs3(4):=numar2(3) and numar1(1); produs3(5):=numar2(3) and numar1(2);
		produs3(6):=numar2(3) and numar1(3); produs3(7):=numar2(3) and numar1(4); 
		
		produs4(4):=numar2(4) and numar1(0); produs4(5):=numar2(4) and numar1(1); produs4(6):=numar2(4) and numar1(2);
		produs4(7):=numar2(4) and numar1(3); 
		
		produs5(5):=numar2(5) and numar1(0); produs5(6):=numar2(5) and numar1(1); produs5(7):=numar2(5) and numar1(2);
			 
		
		produs6(6):=numar2(6) and numar1(0); produs6(7):=numar2(6) and numar1(1);
		
		rezultat<=produs0+produs1+produs2+produs3+produs4+produs5+produs6;	 

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
				
			end arh_inmultire;
		
		
		
		

