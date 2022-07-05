-- Quartus II VHDL Template

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity principal_tb is
	-- port ();
end principal_tb;


architecture rtl of principal_tb is

signal entrada : std_logic_vector (3 downto 0):= "0000";
signal salida  : std_logic_vector (6 downto 0):= "0000000";

begin
	
	entrada <= entrada + '1' after 1 ns;
	
	simulacion: entity work.principal port map
	(	
		entrada_i => entrada,
		salida_o  => salida
	
	);
	
	

		

end rtl;
