-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;

entity ROM_B is
	generic
	(
		DATA_WIDTH : natural := 8;
		 ADD_WIDTH : natural := 5
	);
	port 
	(
		 clk_i : in  std_logic;
		 add_i : in  std_logic_vector( ADD_WIDTH-1 downto 0);
		data_o : out std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end ROM_B;

architecture Behavioral of ROM_B is

subtype Datos is std_logic_vector(DATA_WIDTH-1 downto 0);
type rom_type is array (0 to (2**ADD_WIDTH)-1) of Datos;

signal ROM: rom_type := (	x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"08",
									x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"08",
									x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"08",
									x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"08"
								);

begin

	process(clk_i,add_i)
	
	begin
	
		if rising_edge(clk_i) then 
		
			data_o <= ROM(conv_integer(add_i));
	
		end if;
		
	end process;

end Behavioral;









