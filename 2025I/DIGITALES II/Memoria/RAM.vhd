-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;

entity RAM is
	generic
	(
		DATA_WIDTH : natural := 8; -- Tamaño del numeor de bits
		 ADD_WIDTH : natural := 5  -- Numero de posiciones de memoria en 2^n -> n = ADD_WIDTH
	);
	port 
	(
		 clk_i :  in  std_logic;
		  WR_i :  in  std_logic;
		 add_i :  in  std_logic_vector( ADD_WIDTH-1 downto 0);
		data_i :  in  std_logic_vector(DATA_WIDTH-1 downto 0);
		data_o : out  std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end RAM;

architecture Behavioral of RAM is

subtype Datos is std_logic_vector(DATA_WIDTH-1 downto 0);
type ram_type is array (0 to (2**ADD_WIDTH)-1) of Datos;

signal RAM_MEM: ram_type := (	x"20",x"1F",x"1E",x"1D",
										x"1C",x"1B",x"1A",x"19",
										x"18",x"17",x"16",x"15",
										x"14",x"13",x"12",x"11",
										x"10",x"0F",x"0E",x"0D",
										x"0C",x"0B",x"0A",x"09",
										x"08",x"07",x"06",x"05",
										x"04",x"03",x"02",x"01"
								);

begin

	process(clk_i,add_i,WR_i,data_i)
	
	begin
	
		if rising_edge(clk_i) then 
		
			if WR_i = '0' then -- WR = 0 Lectura	
		
				data_o <= RAM_MEM(conv_integer(add_i));
			
			elsif WR_i = '1' then -- WR = 1 Escritura
				
				RAM_MEM(conv_integer(add_i)) <= data_i;
			
			end if;
	
		end if;
		
	end process;

end Behavioral;