-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal clk_tb : std_logic := '0';
signal contadorA_tb : std_logic_vector(3 downto 0):= "0000";
signal contadorB_tb : std_logic_vector(3 downto 0):= "0000";
signal contadorC_tb : std_logic_vector(3 downto 0):= "0000";
signal contadorD_tb : std_logic_vector(3 downto 0):= "0000";
signal contadorE_tb : std_logic_vector(3 downto 0):= "0000";
signal contadorF_tb : std_logic_vector(3 downto 0):= "0000";

begin

	clk_tb <= not clk_tb after 1ns;
	
	contador: entity work.principal port map
	(
		clk_i			=> clk_tb,
		contadorA_o	=> contadorA_tb,
		contadorB_o	=> contadorB_tb,
		contadorC_o	=> contadorC_tb,
		contadorD_o	=> contadorD_tb,
		contadorE_o	=> contadorE_tb,
		contadorF_o	=> contadorF_tb
	);

end Behavioral;







