library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity scadere is 
	port(								  
	numar1:in std_logic_vector(7 downto 0);
	numar2:in std_logic_vector(7 downto 0);	
	rezultat:out std_logic_vector(7 downto 0));		 
end scadere;

architecture arh_scadere of scadere is
begin 
	process(numar1, numar2)
	begin
		if (numar1(7)='0') then 
			if (numar2(7)='0') then
				if (numar1(6 downto 0)>=numar2(6 downto 0)) then 
					rezultat(6 downto 0)<=numar1(6 downto 0)-numar2(6 downto 0);
					rezultat(7)<='0';
				else 
					rezultat(6 downto 0)<=numar2(6 downto 0)-numar1(6 downto 0);
					rezultat(7)<='1';
				end if;
				else 
					rezultat(6 downto 0)<=numar1(6 downto 0)+numar2(6 downto 0);
					rezultat(7)<='0';
				end if;
				end if;
				if (numar1(7)='1') then 
					if (numar2(7)='0') then 
						rezultat(6 downto 0)<=numar1(6 downto 0)+numar2(6 downto 0);
						rezultat(7)<='1';
					end if;	   
					end if;
					if (numar1(7)='1') then 
						if (numar2(7)='1') then 
						if (numar1(6 downto 0)>=numar2(6 downto 0)) then 
							rezultat(6 downto 0)<=numar1(6 downto 0)-numar2(6 downto 0);
							rezultat(7)<='1';
						else 
							rezultat(6 downto 0)<=numar2(6 downto 0)-numar1(6 downto 0);
							rezultat(7)<='0';
						end if;	 
						end if;
						end if;
						end process;
						end arh_scadere;
				