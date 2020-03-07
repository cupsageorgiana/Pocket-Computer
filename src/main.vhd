library ieee;
use ieee.std_logic_1164.all;

entity calculator is 
	port(clk:in std_logic;
	numar:in std_logic_vector(7 downto 0);
	selectie_operatie:in std_logic_vector(1 downto 0);
	selectie_numar:in std_logic;
	rezultat:inout std_logic_vector(7 downto 0);
	anod:out std_logic_vector(3 downto 0);
	catod:out std_logic_vector(6 downto 0);
	enable:in std_logic;
	semn:out std_logic);
end calculator;

architecture arh_calculator of calculator is 

--adunare 
component adunare is 
	port(								  
	numar1:in std_logic_vector(7 downto 0);
	numar2:in std_logic_vector(7 downto 0);		   
	rezultat:out std_logic_vector(7 downto 0));		 
end component adunare;

--scadere 
component scadere is 
	port(								  
	numar1:in std_logic_vector(7 downto 0);
	numar2:in std_logic_vector(7 downto 0);	
	rezultat:out std_logic_vector(7 downto 0));		 
end component scadere;

--inmultire	
component inmultire is 
	port(								  
	numar1:in std_logic_vector(7 downto 0);
	numar2:in std_logic_vector(7 downto 0);	
	rezultat:out std_logic_vector(7 downto 0));		 
end component inmultire;

--impartire
component impartire is 
	port( 
	numar1:in std_logic_vector(7 downto 0); 
	numar2:in std_logic_vector(7 downto 0);
	rezultat:out std_logic_vector(7 downto 0));
end component impartire;

--selectie operatie	 
component multiplexor is 
	port (
	adunare:in std_logic_vector(7 downto 0);
	scadere:in std_logic_Vector(7 downto 0);
	inmultire:in std_logic_vector(7 downto 0);
	impartire:in std_logic_vector(7 downto 0);
	selectie:in std_logic_Vector(1 downto 0);
	enable:in std_logic;
	iesire:out std_logic_Vector(7 downto 0));
end component multiplexor;

--selectie si introducere numere
component demultiplexor is 
	port(
	intrare:in std_logic_vector(7 downto 0);
	numar1:out std_logic_vector(7 downto 0);
	numar2:out std_logic_vector(7 downto 0);
	selectie:in std_logic;
	enable:in std_logic);
end component demultiplexor;

--afisare 
component afisare is
    port (
	digits : in STD_LOGIC_VECTOR (15 downto 0);
    clock : in STD_LOGIC;
    anode : out STD_LOGIC_VECTOR (3 downto 0);
    catode : out STD_LOGIC_VECTOR (6 downto 0));
end component afisare;	  

--transformare binar-BCD	
component aduna3 is 
	port(
	rezultat:in std_logic_vector(6 downto 0);
	unitati, zeci, sute:out std_logic_vector(3 downto 0));
end component aduna3;

signal nr1,nr2:std_logic_vector(7 downto 0);
signal adunare1,scadere1,inmultire1,impartire1:std_logic_vector(7 downto 0);
signal valoare:std_logic_vector(15 downto 0);	



begin 
	
L1: demultiplexor port map (intrare=>numar, numar1=>nr1, numar2=>nr2, selectie=>selectie_numar, enable=>enable);
L2: adunare port map(numar1=>nr1, numar2=>nr2, rezultat=>adunare1);
L3: scadere port map(numar1=>nr1, numar2=>nr2, rezultat=>scadere1);
L4: inmultire port map (numar1=>nr1, numar2=>nr2, rezultat=>inmultire1);
L5: impartire port map (numar1=>nr1, numar2=>nr2, rezultat=>impartire1);
L6: multiplexor port map (adunare=>adunare1, scadere=>scadere1, inmultire=>inmultire1, impartire=>impartire1, selectie=>selectie_operatie, enable=>enable, iesire=>rezultat);
L7: afisare port map (digits=>valoare, clock=>clk, anode=>anod, catode=>catod);		  


process(numar, selectie_numar, selectie_operatie, enable)
begin 
	if enable='1' and selectie_numar='0' then 
		semn<='0';
		valoare<=x"0000";
	end if;			   
	if enable='1' and selectie_numar='1' then  
		valoare<="00000000" & rezultat; 
		semn<=rezultat(7);
	end if;	
	
	if enable='0' and (selectie_numar='0' or selectie_numar='1') then 
		valoare<="00000000" & numar;  
		semn<=numar(7);
	end if;	
	
end process;

end arh_calculator;
	