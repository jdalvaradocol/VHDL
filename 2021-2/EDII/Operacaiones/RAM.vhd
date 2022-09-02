
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

entity RAM is

		generic
		(
			DATA_WH : natural := 4;
			 ADD_WH : natural := 3
		);
		
		port
		(
			CLK	: in	STD_LOGIC;
			 WR	: in	STD_LOGIC;
			ADD	: in	STD_LOGIC_VECTOR( (ADD_WH) - 1 downto 0);
		DATA_IN	: in	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0);
		DATA_OUT	: out	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0)
	
	);

end RAM;

architecture behavioral of RAM is   

subtype DATOS is STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0);
type RAM_TYPE is array (0 to (2**ADD_WH)-1) of DATOS;

-- Inicializamos la memoria ROM en VHDL.

 signal RAM: RAM_TYPE := ( "0000", "0000", "0000", "0000",
									"0000", "0000", "0000", "0000");  

begin

	process(clk)
	
	begin
		
		if( (rising_edge(clk)) and (WR = '0')) then
		
			DATA_OUT <= RAM(conv_integer(ADD));
			
		elsif ( (rising_edge(clk)) and (WR = '1')) then
		
			RAM(conv_integer(ADD)) <= DATA_IN;
			
		end if;
	
	end process;
	
end behavioral;
