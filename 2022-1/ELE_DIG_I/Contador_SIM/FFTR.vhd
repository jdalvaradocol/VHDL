-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFTR is
	port 
	(
		T_i, clk_i, reset_i : in std_logic;
		Q_o 					  : out std_logic
	);
end FFTR;

architecture Behavioral of FFTR is

signal Q : std_logic := '0'; 

begin

	process(T_i, clk_i, reset_i)
	
	begin
		
		--  rising_edge (clk_i) -> flanco de subida
		-- falling_edge (clk_i) -> flanco de bajada
	
			if reset_i = '1' then 
				Q <= '0';
			elsif falling_edge(clk_i) and T_i = '0' then
				Q <=  Q;
			elsif falling_edge(clk_i) and T_i = '1' then
				Q <= not Q;	
			end if;	
	end process;

	Q_o <= Q;
	
end Behavioral;

