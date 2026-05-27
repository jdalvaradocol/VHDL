-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, X_i  : in std_logic;
		salida_o		: out std_logic_vector(2 downto 0) 
	); 
end principal;


architecture Behavioral of principal is

type nombres_estados is (E0, E1, E2, E3);
signal estado : nombres_estados := E0;

begin
	
	process(clk_i, X_i )
	
	begin
	
		if rising_edge(clk_i) then
		
			if estado = E0 then
			
				salida_o <= "010";
				
				if X_i = '0' then
					estado <= E1;
				elsif X_i = '1' then
					estado <= E3;
				end if;
			
			elsif estado = E1 then
			
				salida_o <= "011";
				
				if X_i = '0' then
					estado <= E2;
				elsif X_i = '1' then
					estado <= E0;
				end if;	
	
			elsif estado = E2 then
			
				salida_o <= "101";
				
				if X_i = '0' then
					estado <= E3;
				elsif X_i = '1' then
					estado <= E1;
				end if;	

			elsif estado = E3 then
			
				salida_o <= "111";
				
				if X_i = '0' then
					estado <= E0;
				elsif X_i = '1' then
					estado <= E2;
				end if;	
			
			end if;
			
		end if;	
			
	end process;
	
end Behavioral;






