-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal       clk_tb : std_logic := '0';
signal         R_tb : std_logic := '0';
signal contador9_tb : std_logic_vector(3 downto 0):= "0000";
signal contador5_tb : std_logic_vector(3 downto 0):= "0000";
		
begin

	clk_tb <= not clk_tb after 1ns;
	
	contador_tb: entity work.principal port map
	(
		clk_i  		=>       clk_tb,
		R_o			=>         R_tb,	
		contador9_o => contador9_tb,  	
		contador5_o => contador5_tb 	
	);

end Behavioral;
