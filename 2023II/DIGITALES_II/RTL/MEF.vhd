-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEF is
	port 
	(
		    clk_i : in std_logic;
		     wr_o : out std_logic;
		add_rom_o : out std_logic_vector(4 downto 0);
		add_ram_o : out std_logic_vector(4 downto 0)
	);
end MEF;

architecture Behavioral of MEF is

type mef_type is (S0, S1, S2, S3, S4);
signal estado : mef_type := S0;

signal contador : integer range 0 to 31 := 0;


begin

	process(clk_i)
	
	begin 

		if rising_edge(clk_i) then
			
			if estado = S0 then
				estado <= S1;
								
				add_rom_o <= std_logic_vector(to_unsigned(contador, add_rom_o'length));
				add_ram_o <= std_logic_vector(to_unsigned(contador, add_ram_o'length));
					  wr_o <= '1'; 
								
			elsif estado = S1 then
				estado <= S2;
				
				wr_o <= '1'; 
					
			elsif estado = S2 then
				estado <= S3;
		
				wr_o <= '1'; 
						
			elsif estado = S3 then
				estado <= S4;

				wr_o <= '0'; 
	
			elsif estado = S4 then
				estado <= S0;				
				
				if contador < 31 then
					contador <= contador + 1;
				else 
					contador <= 0;
				end if;
				
			end if;
			
		end if;	
			
	end process;

end Behavioral;








