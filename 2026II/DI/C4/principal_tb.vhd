-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL; 
use ieee.numeric_std.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal  A_tb : std_logic_vector (3 downto 0) := "0000";
signal  B_tb : std_logic_vector (3 downto 0) := "0000";
signal  S_tb : std_logic_vector (4 downto 0) := "00000";
		
begin

	A_tb <= A_tb + '1' after 1ns;
	B_tb <= B_tb + '1' after 16ns;
	
	suma_tb: entity work.principal port map
	(	
		A_i => A_tb,
		B_i => B_tb,
		S_o => S_tb
	);

end Behavioral;






