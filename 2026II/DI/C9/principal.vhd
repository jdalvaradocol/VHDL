-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		   clk_i :  in std_logic;
			  X_i :  in std_logic_vector(1 downto 0);
		salida_o : out std_logic_vector(1 downto 0)
	);
end principal;

architecture Behavioral of principal is

signal estado : std_logic_vector(1 downto 0) := "00";

begin
	
	process(clk_i, X_i)
	
	begin
	
		if rising_edge(clk_i) then
		
			if estado = "00" then
				
				salida_o <= "10";
				
				if X_i = "00" then
					estado <= "00";
				elsif X_i = "01" then
					estado <= "01";
				elsif X_i = "10" then
					estado <= "11";
				elsif X_i = "11" then
					estado <= "00";
				end if;	
			
			elsif estado = "01" then
				
				salida_o <= "01";
				
				if X_i = "00" then
					estado <= "01";
				elsif X_i = "01" then
					estado <= "10";
				elsif X_i = "10" then
					estado <= "00";
				elsif X_i = "11" then
					estado <= "01";
				end if;

			elsif estado = "10" then
				
				salida_o <= "11";
				
				if X_i = "00" then
					estado <= "10";
				elsif X_i = "01" then
					estado <= "11";
				elsif X_i = "10" then
					estado <= "01";
				elsif X_i = "11" then
					estado <= "10";
				end if;		
	
			elsif estado = "11" then
				
				salida_o <= "00";
				
				if X_i = "00" then
					estado <= "11";
				elsif X_i = "01" then
					estado <= "00";
				elsif X_i = "10" then
					estado <= "10";
				elsif X_i = "11" then
					estado <= "11";
				end if;		
	
			end if;
		
		end if;
			
	end process;

	
end Behavioral;







