
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity leds is
		port
		(
				   clk_i : in	std_logic;
			  add_ram_i	: in	std_logic_vector(1 downto 0);
			 data_ram_i	: in	std_logic_vector(7 downto 0);
				  leds_o	: out	std_logic_vector(7 downto 0)
			
	);

end leds;

architecture behavioral of leds is   

begin
	
	process(clk_i,add_ram_i,data_ram_i)
	
	begin
	
		if rising_edge (clk_i) then
			
			if  add_ram_i = "01" then  
		
				leds_o <= data_ram_i;
				
			end if;
		
		end if;
		
	end process;	
	
end behavioral;
