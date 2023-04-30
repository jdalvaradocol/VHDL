
-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unidad_control is
	port 
	(
		reset_i, clk_i 							:  in std_logic;
		data_rom_i 									:  in std_logic_vector(7 downto 0);
		data_ALU_i, data_wreg_i, data_ram_i :  in std_logic_vector(3 downto 0);
		data_ram_o, data_wreg_o             : out std_logic_vector(3 downto 0);
		add_ram_o, add_rom_o 					: out std_logic_vector(3 downto 0);
		wr_ram_o, wr_wreg_o  					: out std_logic;									
		alu_A_o, alu_B_o							: out std_logic_vector (3 downto 0);	
		sel_ope_o									: out std_logic_vector (1 downto 0)			
	);
end unidad_control;

architecture Behavioral of unidad_control is

type estado_type is (INICIO, LEC_ROM, ROM_DATA, DECODE, LEC_RAM, LEC_WREG, LEC_ALU, GUARDAR, PERIFERICOS );
signal estado : estado_type := INICIO; 

signal data_rom 		: std_logic_vector(7 downto 0):= "00000000";
signal add_rom			: integer range 0 to 15:= 0;
signal data_ALU 		: std_logic_vector(3 downto 0):= "0000";
signal data_literal 	: std_logic_vector(3 downto 0):= "0000";

signal sel_ope 		: std_logic_vector(1 downto 0):= "00";
signal LR            : std_logic := '0';									
signal WR 				: std_logic := '0';									

begin

	process(clk_i, reset_i)
	begin

		if reset_i = '1'  then
								
			data_rom <= "00000000";
			sel_ope 	<= "00";
			LR		  	<= '0';
			WR			<= '0';
		
			estado <= INICIO;
			
		elsif rising_edge (clk_i) 		then
		
			if estado = INICIO 			then
	
				data_rom <= "00000000";
				sel_ope 	<= "00";
				LR		  	<= '0';
				WR			<= '0';

				estado <= LEC_ROM;

			elsif estado = LEC_ROM 		then
				
				add_rom <= add_rom + 1;
				add_rom_o <= std_logic_vector(to_unsigned(add_rom,add_rom_o'length));

				estado <= ROM_DATA;
				
			elsif estado = ROM_DATA 		then
				
				data_rom	<= data_rom_i;
				
				estado <= DECODE;
							
			elsif estado = DECODE 		then
			
				-- Operacion 2 bist, LR, WR, Literar o Registro 4 bits
				--	data_rom	<= to_integer(unsigned(data_rom_i));
		
				sel_ope 	<= data_rom(7 downto 6);
				LR		  	<= data_rom(5);
				WR			<= data_rom(4);

				estado <= LEC_RAM;
				
			elsif estado = LEC_RAM 		then
			
				-- LR = 0 RAM, LR = 1 Literal
		
				if LR = '0' then 
				
					add_ram_o <= data_rom(3 downto 0);
					wr_ram_o  <= '1'; -- Leer RAM
				
				elsif LR = '1' then
					
					data_literal <= data_rom(3 downto 0);
				
				end if;
		
				wr_wreg_o <= '1'; -- Leer W
		
				estado <= LEC_WREG;

			elsif estado = LEC_WREG 	then

				sel_ope_o <= sel_ope;
				alu_A_o   <= data_wreg_i ;

				if LR = '0' then
					alu_B_o <= data_ram_i  ;
				elsif LR = '1' then
					alu_B_o <= data_literal ;	
				end if;
		
				estado <= LEC_ALU;
				
			elsif estado = LEC_ALU 			then
			
				data_ALU <= data_ALU_i ;
					
			elsif estado = GUARDAR 		then
			
				-- WR = 0 Guarda en W
				-- WR = 1 Guarda en R#
				
				if WR = '0' then 
					wr_wreg_o   <= '0'; -- Escribir W
					data_wreg_o <= data_ALU;  
				elsif WR = '1' then
					data_ram_o <= data_ALU;
					add_ram_o  <= data_rom(3 downto 0);
					wr_ram_o   <= '0'; -- Leer RAM
				end if;
		
				estado <= PERIFERICOS;
	
			elsif estado = PERIFERICOS then
			
				estado <= LEC_ROM;
					
			end if;
			
		end if;	
			
	end process;

end Behavioral;







