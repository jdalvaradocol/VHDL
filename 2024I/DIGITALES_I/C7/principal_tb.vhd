-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal A_tb : std_logic_vector(3 downto 0) := "0000";
signal B_tb : std_logic_vector(3 downto 0) := "0000";
signal S_tb : std_logic_vector(3 downto 0) := "0000";
signal NP_tb : std_logic := '0';

begin

	-- clk_tb <= not clk_tb after 1ns;
	
	A_tb <= 	A_tb + "0001" after 1ns; 
	B_tb <= 	B_tb + "0001" after 16ns;  
	
	restador_tb: entity work.principal port map
	(
		A_i  => A_tb, 
		B_i  => B_tb,
		NP_o => NP_tb,	
		S_o  => S_tb	 	
	);

end Behavioral;







