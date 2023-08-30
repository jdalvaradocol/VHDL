
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

entity RAM is

		generic
		(
			DATA_WIDTH : natural := 4;
			 ADD_WIDTH : natural := 4
		);
		
		port
		(
			clk_i	: in	STD_LOGIC;
			 wr_i	: in	STD_LOGIC;
			add_i	: in	STD_LOGIC_VECTOR( (ADD_WIDTH) - 1 downto 0);
		  data_i	: in	STD_LOGIC_VECTOR((DATA_WIDTH) - 1 downto 0);
		  data_o	: out	STD_LOGIC_VECTOR((DATA_WIDTH) - 1 downto 0)
	
	);

end RAM;

architecture behavioral of RAM is   

subtype Datos is std_logic_vector(DATA_WIDTH-1 downto 0);
type ram_type is array (0 to (2**ADD_WIDTH)-1) of Datos;

signal RAM: ram_type := (	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
									x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
									x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
									x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"
								);

-- Inicializamos la memoria ROM con archivo .mif.

-- signal RAM : RAM_TYPE;
-- attribute ram_init_file : string;
-- attribute ram_init_file of RAM : signal is "memoria.mif";

begin

	process(clk_i, WR_i)
	
	begin
		
		if ((rising_edge(clk_i)) and (WR_i = '0')) then
		
			data_o <= RAM(conv_integer(add_i));
			
		elsif ( (rising_edge(clk_i)) and (WR_i = '1')) then
		
			RAM(conv_integer(add_i)) <= data_i;
			
		end if;
	
	end process;
	
end behavioral;
