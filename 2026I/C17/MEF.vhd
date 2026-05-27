-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEF is
	port 
	(	
		              clk_i 	:  in std_logic;
		         pos_dato_o 	: out std_logic_vector(1 downto 0);
		activar_operacion_o	: out std_logic;
		          add_rom_o  : out std_logic_vector(3 downto 0);
					 add_ram_o  : out std_logic_vector(1 downto 0);
					      WR_o  : out std_logic
	);
end MEF;

architecture Behavioral of MEF is

type nombres_estados is (E0, E1, E2, E3, E4, E5, E6, E7);
signal estado : nombres_estados := E0;

-- 0 1
-- 2 3

signal add_rom : integer range 0 to 15:= 0; 
signal add_ram : integer range 0 to 3:= 0; 

begin

	process(clk_i)
	
	begin
	
		if rising_edge(clk_i) then
		
			if estado = E0 then
			
				add_rom_o <= std_logic_vector(to_unsigned(add_rom, add_rom_o'length));
				add_rom <= add_rom + 1;
				activar_operacion_o <= '0';
				
				estado <= E1;

			elsif estado = E1 then
			
				pos_dato_o <= "00";					
				activar_operacion_o <= '0';
				estado <= E2;	
				
			elsif estado = E2 then
				
				add_rom_o <= std_logic_vector(to_unsigned(add_rom, add_rom_o'length));
				activar_operacion_o <= '0';

				if add_rom < 15 then
					add_rom <= add_rom + 1;
				else
					add_rom <= 0;
				end if;					

				estado <= E3;
				
			elsif estado = E3 then

				pos_dato_o <= "01";				
				activar_operacion_o <= '0';
				estado <= E4;	
				
			elsif estado = E4 then
				
				pos_dato_o <= "10";
				activar_operacion_o <= '1';
				estado <= E5;	
			
			elsif estado = E5 then
			
				add_ram_o <= std_logic_vector(to_unsigned(add_ram, add_ram_o'length));

				     WR_o <= '0'; -- Escribir en la RAM
				
				activar_operacion_o <= '0';

				   estado <= E6;
				
			elsif estado = E6 then
				
				activar_operacion_o <= '0';

				estado <= E7;		

			elsif estado = E7 then
				
				add_ram_o <= std_logic_vector(to_unsigned(add_ram, add_ram_o'length));
				     WR_o <= '1'; -- Leer en la RAM

				activar_operacion_o <= '0';
				
				if add_ram < 3 then
					add_ram <= add_ram + 1;
				else
					add_ram <= 0;
				end if;
				
				estado <= E0;				

			end if;	 
			
		end if;
	
	end process;

end Behavioral;






