
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

entity ROM_B is

		generic
		(
			DATA_WH : natural := 4;
			 ADD_WH : natural := 3
		);
		
		port
		(
			CLK	: in	STD_LOGIC;
			ADD	: in	STD_LOGIC_VECTOR( (ADD_WH) - 1 downto 0);
			DATA	: out	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0)
		);

end ROM_B;

architecture behavioral of ROM_B is   

subtype DATOS is STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0);
type ROM_TYPE is array (0 to (2**ADD_WH)-1) of DATOS;

-- Inicializamos la memoria ROM en VHDL.


-- signal ROM: ROM_TYPE := ( 	"1111", "1110", "1101", "1100",
--									"1011", "1010", "1001", "1000",
--									"0111", "0110", "0101", "0100",
--									"0011", "0010", "0001", "0000"
--								);  

-- Inicializamos la memoria ROM con archivo .mif.

signal ROM : ROM_TYPE;
attribute ram_init_file : string;
attribute ram_init_file of ROM : signal is "memoria_b.mif";

begin

	process(clk)
	
	begin
		
		if(rising_edge(clk)) then
		
			DATA <= ROM(conv_integer(ADD));
			
		end if;
	
	end process;
	
end behavioral;
	
	
	
	