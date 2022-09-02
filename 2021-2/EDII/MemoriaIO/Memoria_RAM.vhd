
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

entity Memoria_RAM is

		generic
		(
			DATA_WH : natural := 8;
			 ADD_WH : natural := 2
		);
		
		port
		(
			CLK	: in	STD_LOGIC;
			 WR	: in	STD_LOGIC;
		 ADD_i	: in	STD_LOGIC_VECTOR( (ADD_WH) - 1 downto 0);
		DATA_IN	: in	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0);
		  ADD_o	: out	STD_LOGIC_VECTOR( (ADD_WH) - 1 downto 0);
		DATA_OUT	: out	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0)
	
	);

end Memoria_RAM;

architecture behavioral of Memoria_RAM is   

subtype DATOS is STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0);
type RAM_TYPE is array (0 to (2**ADD_WH)-1) of DATOS;

-- Inicializamos la memoria ROM en VHDL.

 signal RAM: RAM_TYPE := ( 	"00000000", "00000000", 
										"00000000", "00000000"
									);  

begin

	process(clk)
	
	begin
		
		if( (rising_edge(clk)) and (WR = '0')) then
		
			DATA_OUT <= RAM(conv_integer(ADD_i));
			ADD_o		<=  ADD_i;
			
		elsif ( (rising_edge(clk)) and (WR = '1')) then
		
			RAM(conv_integer(ADD_i)) <= DATA_IN;
			
		end if;
	
	end process;
	
end behavioral;
