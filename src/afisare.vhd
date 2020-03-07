library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity afisare is
    Port ( digits : in std_logic_vector (15 downto 0);
           clock : in std_logic;
           anode : out std_logic_vector (3 downto 0);
           catode : out std_logic_vector(6 downto 0));
end afisare;

architecture arh_afisare of afisare is
    signal digit1:std_logic_vector(3 downto 0);
    signal digit2:std_logic_vector(3 downto 0);
    signal digit3:std_logic_vector(3 downto 0);
    signal digit4:std_logic_vector(3 downto 0);
    
    signal count: std_logic_vector(15 downto 0):=x"0000";
    signal mux:std_logic_vector(3 downto 0):="0000";

begin

    digit1<=digits(3 downto 0);
    digit2<=digits(7 downto 4);
    digit3<=digits(11 downto 8);
    digit4<=digits(15 downto 12);
    
    process(clock)
    begin
        if clock='1' and clock'event then
            count<=count+1;
        end if;
    
    end process;
    
    process(count)
    begin
        case count(15 downto 14) is
             when "00" => anode<="1110";
             when "01" => anode<="1101";
             when "10" => anode<="1011";
             when others => anode<="0111";
        
        end case;
    end process;
    
    process(count)
        begin
            case count(15 downto 14) is
                 when "00" => mux<=digit1;
                 when "01" => mux<=digit2;
                 when "10" => mux<=digit3;
                 when others => mux<=digit4;
            
            end case;
    end process;
    
    process(count)
        begin
            case mux is
                when "0000" => catode<="0000001";
                when "0001" => catode<="1001111";
                when "0010" => catode<="0010010";
                when "0011" => catode<="0000110";
                when "0100" => catode<="1001100";
                when "0101" => catode<="0100100";
                when "0110" => catode<="0100000";
                when "0111" => catode<="0001111";
                when "1000" => catode<="0000000";
                when "1001" => catode<="0000100";
                when "1010" => catode<="0000010";
                when "1011" => catode<="1100000";
                when "1100" => catode<="0110001";
                when "1101" => catode<="1000010";
                when "1110" => catode<="0110000";
                when others => catode<="0111000";
            end case;
        end process;

end arh_afisare;
