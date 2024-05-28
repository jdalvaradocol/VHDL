-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i :  in std_logic;
		  X_i :  in std_logic_vector(1 downto 0);
		  Y_o : out std_logic_vector(3 downto 0);
		  S_o : out std_logic_vector(1 downto 0)
	);
end principal;

architecture Behavioral of principal is

signal estado : integer range 0 to 3 := 0; 

begin

		process(clk_i, X_i)
		
		begin
		
			if rising_edge(clk_i) then 
			
				if estado = 0 then 		-- estado 0
				
					Y_o <= "0001";
					
					if X_i = "00" then 
						estado <= 0;
					elsif X_i = "01" then 
						estado <= 3;
					elsif X_i = "10" then 
						estado <= 1;
					elsif X_i = "11" then 
						estado <= 0;
					end if;	
					
				elsif estado = 1 then 	-- estado 1
					
					Y_o <= "0010";
					
					if X_i = "00" then 
						estado <= 1;
					elsif X_i = "01" then 
						estado <= 1;
					elsif X_i = "10" then 
						estado <= 2;
					elsif X_i = "11" then 
						estado <= 1;
					end if;	
					
				elsif estado = 2 then 	-- estado 2
					
					Y_o <= "0100";
					
					if X_i = "00" then 
						estado <= 2;
					elsif X_i = "01" then 
						estado <= 1;
					elsif X_i = "10" then 
						estado <= 3;
					elsif X_i = "11" then 
						estado <= 2;
					end if;	
					
				elsif estado = 3 then 	-- estado 3
					
					Y_o <= "1000";
					
					if X_i = "00" then 
						estado <= 3;
					elsif X_i = "01" then 
						estado <= 2;
					elsif X_i = "10" then 
						estado <= 0;
					elsif X_i = "11" then 
						estado <= 3;
					end if;	
					
				end if;
				
			end if;	

		end process;
	
end Behavioral;









