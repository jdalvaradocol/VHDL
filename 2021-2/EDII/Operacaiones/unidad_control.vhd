
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity unidad_control is
		port
		(
			clk_i  		: in	STD_LOGIC;
			Rom_A_add_o	: out	STD_LOGIC_VECTOR( 2 downto 0);
			clk_rom_A_o : out	STD_LOGIC;
			Rom_B_add_o	: out	STD_LOGIC_VECTOR( 2 downto 0);
			clk_rom_B_o : out	STD_LOGIC;
			Operacion_o	: out	STD_LOGIC_VECTOR( 1 downto 0);
			Ram_add_o	: out	STD_LOGIC_VECTOR( 2 downto 0);
			WR_o  		: out	STD_LOGIC;
			clk_ram_o  	: out	STD_LOGIC
		);

end unidad_control;

architecture behavioral of unidad_control is   

signal estado 	: integer range 0 to  3:= 0;
signal rom_A 	: integer range 0 to  7:= 0;
signal rom_B 	: integer range 0 to  7:= 0;
signal ram 		: integer range 0 to  7:= 0;

signal contador : integer range 0 to  50000000:= 0;

signal div_clk : std_LOGIC := '0';


begin
		
		process(clk_i)
		
		begin	
				
				if rising_edge (div_clk) then
				
					if estado = 0 then
					
						Rom_A_add_o	<= "000";
						Rom_B_add_o	<= "000";
						Operacion_o	<= "00";
						Ram_add_o	<= "000";
						WR_o  		<= '0';
						
						estado 	<= estado + 1;
						rom_A  	<= 0;
						rom_B 	<= 0;
						ram 		<= 0;
					
					elsif estado = 1 then
	
						Rom_A_add_o <= std_logic_vector(to_unsigned(rom_A,3));
						Rom_B_add_o <= std_logic_vector(to_unsigned(rom_B,3));
						
						-- Se selecciona la operacaion logica AND
						Operacion_o	<= "00"; 
						
						estado 	<= estado + 1;
						rom_A  	<= rom_A + 1;
						rom_B 	<= rom_A + 1;
						ram 		<= 0;
						
					elsif estado = 2 then
					
						Ram_add_o <= std_logic_vector(to_unsigned(ram,3));
						
						-- Memoria RAM en escritura.
						
						WR_o  	<= '1';
						
						estado 	<= estado + 1;

					elsif estado = 3 then
						
						Ram_add_o <= std_logic_vector(to_unsigned(ram,3));

						-- Memoria RAM en lectura.
						
						WR_o  	<= '0';
						
						estado 	<= 1;			
						ram 		<= ram + 1;
						
					end if;
				
				end if;
		
		end process;
		
		
		div_frec:process(clk_i)
		
		begin	
		
				if rising_edge(clk_i) then
				
					contador <= contador + 1;
					
				end if;
				
				if contador = 50000000 then 
					
					contador <= 0;
					
					div_clk <= not div_clk;
					
				end if;
				
		
		end process;
	
		clk_rom_A_o <= div_clk;
		clk_rom_B_o	<= div_clk; 
		clk_ram_o 	<= div_clk;

end behavioral;
	