
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ope_inv is

	port
	(
		data_rom_i	: in	std_logic_vector(7 downto 0);
		data_ram_o	: out	std_logic_vector(7 downto 0)
	);

end entity;

architecture rtl of ope_inv is

begin

	data_ram_o <= not data_rom_i;
	
end rtl;