-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity sumador_tb is
	-- port ();
end sumador_tb;

architecture rtl of sumador_tb is

signal A_tb : std_logic_vector(2 downto 0):="000";
signal B_tb : std_logic_vector(2 downto 0):="000";
signal S_tb : std_logic_vector(3 downto 0):="0000";

begin

	A_tb <= A_tb + '1' after 8 ns;
	B_tb <= B_tb + '1' after 1 ns;
	
	Suma: entity work.sumador port map
			(
				A_i => A_tb, 
				B_i => B_tb,
				S_o => S_tb
			
			);
			
end rtl;