

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador is
		port (
					clk_i		:  in std_logic;
					SalidaA_o	: out std_logic_vector(3 downto 0);
					SalidaB_o	: out std_logic_vector(3 downto 0)
				);
end contador;


architecture rtl of contador is 

signal unidad : integer range 0 to 10 := 0;
signal decena : integer range 0 to 10 := 0;

begin

	process(clk_i) 
	
	begin
	
	if rising_edge(clk_i) then 


		if	(unidad = 8) and (decena = 4) then
					
				unidad <= 0;
				decena <= 0;
		
		elsif unidad = 9 then 
	
			unidad <= 0;
				
			if decena = 9 then 
			
				decena <= 0;
					
			else 
			
				decena <= decena + 1;

			end if;
		
		else

			unidad <= unidad + 1;
		
		end if;
	
	end if;	
	
	end process;

	SalidaA_o <= std_logic_vector(to_unsigned(unidad,4));
	SalidaB_o <= std_logic_vector(to_unsigned(decena,4));
	
end rtl;

