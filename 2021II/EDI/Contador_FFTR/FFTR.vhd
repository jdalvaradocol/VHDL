-- Quartus II VHDL Template
-- Configurable gate architecture

library ieee;
use ieee.std_logic_1164.all;

entity FFTR is
	port 
	(
		clk_i, T_i, R_i 	: in  std_logic;
		Q_o 					: out std_logic
	);
end FFTR;


-- Three possible architectures
architecture rtl of FFTR is

signal Q : std_logic := '0';

begin
	
	process(clk_i,T_i,R_i) -- Lista de sensibilidad. 
	
	begin
	
		-- if	rising_edge () Flanco de subida 
	
		-- if	falling_edge () Flanco de bajada 
	
		if R_i = '1' then 
			
				Q <= '0';
				
		elsif	falling_edge (clk_i) then
		
				if T_i = '0' then
				
					Q <= Q;
					
				elsif T_i = '1' then
			
					Q <= not Q;
		
				end if;
				
		end if;	

		end process;
		
		Q_o <= Q;	
		
end rtl;


