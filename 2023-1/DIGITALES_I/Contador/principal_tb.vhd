-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal clk_tb 	: std_logic := '0';
signal T_tb 	: std_logic   := '1';
signal contadorA_tb  : std_logic_vector(3 downto 0) := "0000";
signal contadorB_tb  : std_logic_vector(3 downto 0) := "0000";

begin

	clk_tb <= not clk_tb after 1ns;
	
	Contador: entity work.principal port map
	(
		clk_i        => clk_tb,
		T_i          => T_tb,
		contadorA_o  => contadorA_tb,
		contadorB_o  => contadorB_tb	
	);

end Behavioral;






