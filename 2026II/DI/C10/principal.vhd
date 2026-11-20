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

type estado_t is (E0, E1, E2, E3);
-- type estado_t is (estado0, estado1, estado2, estado3);

signal estado_actual : estado_t:= E0; 

signal estado : std_logic_vector(1 downto 0) := "00";

begin
	
	process(clk_i, X_i)
	
	begin
	
		if rising_edge(clk_i) then
		
			if estado_actual = E0 then
				
				salida_o <= "10";
				
				if X_i = "00" then
					estado_actual <= E0;
				elsif X_i = "01" then
					estado_actual <= E1;
				elsif X_i = "10" then
					estado_actual <= E3;
				elsif X_i = "11" then
					estado_actual <= E0;
				end if;	
			
			elsif estado_actual = E1 then
				
				salida_o <= "01";
				
				if X_i = "00" then
					estado_actual <= E1;
				elsif X_i = "01" then
					estado_actual <= E2;
				elsif X_i = "10" then
					estado_actual <= E0;
				elsif X_i = "11" then
					estado_actual <= E1;
				end if;

			elsif estado_actual = E2 then
				
				salida_o <= "11";
				
				if X_i = "00" then
					estado_actual <= E2;
				elsif X_i = "01" then
					estado_actual <= E3;
				elsif X_i = "10" then
					estado_actual <= E1;
				elsif X_i = "11" then
					estado_actual <= E2;
				end if;		
	
			elsif estado_actual = E3 then
				
				salida_o <= "00";
				
				if X_i = "00" then
					estado_actual <= E3;
				elsif X_i = "01" then
					estado_actual <= E0;
				elsif X_i = "10" then
					estado_actual <= E2;
				elsif X_i = "11" then
					estado_actual <= E3;
				end if;		
	
			end if;
		
		end if;
			
	end process;

end Behavioral;







