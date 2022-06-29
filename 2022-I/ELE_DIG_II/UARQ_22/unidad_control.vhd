-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unidad_control is

	port
	(
		clk_i, reset_i		 	 				 : in	 std_logic;
		data_rom_i				 				 : in	 std_logic_vector(7 downto 0);
		data_ram_i				 				 : in	 std_logic_vector(3 downto 0);
		entradaALU_i			    			 : in	 std_logic_vector(3 downto 0);
		clk_o, WR_o, habilitar_i			 : out std_logic;
		ope_ALU_o				 				 : out std_logic_vector(1 downto 0);
		salidaALU_o, W_o, RAM_o	 			 : out std_logic_vector(3 downto 0);		
		add_ram_o, add_rom_o  				 : out std_logic_vector(1 downto 0)
	);

end entity;

architecture rtl of unidad_control is

signal estado  : integer range 0 to 6 := 0;
signal add_rom : integer range 0 to 3 := 0;
signal add_ram : integer range 0 to 3 := 0;

signal data : std_logic_vector(7 downto 0) := "00000000";

signal operacion 		: std_logic_vector(1 downto 0) := "00";
signal operador  		: std_logic := '0';
signal destino  		: std_logic := '0';
signal registro 		: std_logic_vector(1 downto 0) := "00";
signal literal_alu 	: std_logic_vector(3 downto 0) := "0000";

begin

	process (clk_i, reset_i)
	begin

		if reset_i = '1' then
			
			add_rom_o <= "00";
			add_ram_o <= "00";
				  WR_o <= '0';	
			   estado <= 0;
				add_rom <= 0;
				add_ram <= 0;

		elsif (rising_edge(clk_i)) then
		
			-- Se define el comportamiento del estado S0
			
			if estado = 0 then 
			
				add_rom_o <=  std_logic_vector(to_unsigned(add_rom,add_rom_o'length));
				estado <= estado + 1;
			
			-- Se define el comportamiento del estado S1	
	
			elsif estado = 1  then 	

				estado <= estado + 1;

			-- Se define el comportamiento del estado S2	
				
			elsif estado = 2  then 	

				data <= data_rom_i;
							
			-- Se define el comportamiento del estado S3	
			
			elsif estado = 3  then 	

				operacion 		<= data(7 downto 6);
				operador  		<= data(5);
				destino   		<= data(4);
				registro 		<= data(1 downto 0);
				literal_alu 	<= data(3 downto 0);
			
				estado <= estado + 1;
				 
			-- Se define el comportamiento del estado S4	
			
			elsif estado = 4  then 	

				-- operador = 0 entonces L -> W
				-- operador = 1 entonces R -> W
					
				if operador = '0' then
				
					salidaALU_o <= literal_alu;
					ope_ALU_o  	<= operacion;
					
				else
				
					add_ram_o <= registro;
						  WR_o <= '0'; -- Leer
						  
				end if;
					
				estado <= estado + 1;	
			
			-- Se define el comportamiento del estado S5	
			
			elsif estado = 5  then 	

				 estado <= estado + 1;	
				
			-- Se define el comportamiento del estado S6	
			
			elsif estado = 6 then 	

				if operador = '1' then
				
					salidaALU_o <= data_ram_i;
					ope_ALU_o  	<= operacion;
								
				end if;
				
				estado <= estado + 1;	
			
			elsif estado = 7 then 	

				if destino = '0' then
				
					-- Se Almacena el dato en W
					
					habilitar_i <= '1';
					W_o  	<= entradaALU_i;
					
					RAM_o   	  <= "0000";
					add_ram_o  <= "00";	
					WR_o 		  <= '0';
					
				else
			
					habilitar_i <= '0';
					W_o  	<= "0000";
					
					-- Se Almacena el dato en R
				
					RAM_o   	 <= entradaALU_i;
					add_ram_o <= registro;	
					WR_o <= '1';
						
				end if;
				
				estado <= estado + 1;	

				elsif estado = 8 then 	

					habilitar_i <= '0';
					W_o  			<= "0000";
					RAM_o   	 	<= "0000";
					add_ram_o 	<= registro;	
					WR_o 			<= '0';
										
					estado <= 0;	
				
			end if;
			
		end if;	
			
	end process;
	
	clk_o <= clk_i;
	
end rtl;