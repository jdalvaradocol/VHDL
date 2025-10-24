-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity contador4 is
	port 
	(
		     clk_i : in std_logic;
		contador_o : out std_logic_vector(3 downto 0);
		       R_o : out std_logic 
	);
end contador4;

architecture Behavioral of contador4 is

component FFTR is
	port 
	(
		T_i, clk_i, R_i : in  std_logic;	
		            Q_o : out std_logic
	);
end component;

signal reset : std_logic := '0';
signal cable : std_logic_vector (3 downto 0):= "0000";

begin

	BITA : FFTR port map
	(
		T_i   => '1', 
		clk_i => clk_i, 
		R_i   => reset,
		Q_o   => cable(0)
 	);

	BITB : FFTR port map
	(
		T_i   => '1', 
		clk_i => cable(0), 
		R_i   => reset,
		Q_o   => cable(1)
 	);
	
	BITC : FFTR port map
	(
		T_i   => '1', 
		clk_i => cable(1), 
		R_i   => reset,
		Q_o   => cable(2)
 	);
	
	BITD : FFTR port map
	(
		T_i   => '1', 
		clk_i => cable(2), 
		R_i   => reset,
		Q_o   => cable(3)
 	);
	
	reset <= '1' when cable = "0101" else '0';
	
--	process(clk_i)
--	
--	begin 
--	
--		if falling_edge(clk_i) then
--		
--			if cable = "1001" then
--				reset <= '1';
--			else	
--				reset <= '0';
--			end if;
--			
--		end if;
--	
--	end process;
	
	contador_o <= cable;
	R_o <= reset;
	
end Behavioral;