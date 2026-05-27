-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, X_i : in std_logic;
		salida_o   : out std_logic_vector(2 downto 0)
	);
end principal;

architecture Behavioral of principal is

signal estado : std_logic_vector(2 downto 0):= "000"; 

begin
	
	process(clk_i, X_i)
	
	begin
	
		if rising_edge(clk_i) then 
		
			if estado = "010" then -- E0 = 2
				
				salida_o <= "010";
				
				if X_i = '0' then
					estado <= "011";
				elsif X_i = '1' then
					estado <= "111";
				end if;
			
			elsif estado = "011" then -- E1 = 3
				
				salida_o <= "011";
				
				if X_i = '0' then
					estado <= "101";
				elsif X_i = '1' then
					estado <= "010";
				end if;
		
			elsif estado = "101" then -- E2 = 5
				
				salida_o <= "101";
				
				if X_i = '0' then
					estado <= "111";
				elsif X_i = '1' then
					estado <= "011";
				end if;			

			elsif estado = "111" then -- E3 = 7
				
				salida_o <= "111";
				
				if X_i = '0' then
					estado <= "010";
				elsif X_i = '1' then
					estado <= "101";
				end if;		
			
			else
				
				estado <= "010";
				salida_o <= "010";   
				
			end if;
		
		end if;
		
	end process;	
				
end Behavioral;






