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

type mef_t is (estado0, estado1, estado2, estado3);

signal estado : mef_t := estado0;

begin

		process(clk_i, X_i)
		
		begin
		
			if rising_edge(clk_i) then 
			
				if estado = estado0 then 		-- estado 0
				
					Y_o <= "0001";
					
					if X_i = "00" then 
						estado <= estado0;
					elsif X_i = "01" then 
						estado <= estado3;
					elsif X_i = "10" then 
						estado <= estado1;
					elsif X_i = "11" then 
						estado <= estado0;
					end if;	
					
				elsif estado = estado0 then 	-- estado 1
					
					Y_o <= "0010";
					
					if X_i = "00" then 
						estado <= estado1;
					elsif X_i = "01" then 
						estado <= estado1;
					elsif X_i = "10" then 
						estado <= estado2;
					elsif X_i = "11" then 
						estado <= estado1;
					end if;	
					
				elsif estado = estado2 then 	-- estado 2
					
					Y_o <= "0100";
					
					if X_i = "00" then 
						estado <= estado2;
					elsif X_i = "01" then 
						estado <= estado1;
					elsif X_i = "10" then 
						estado <= estado3;
					elsif X_i = "11" then 
						estado <= estado2;
					end if;	
					
				elsif estado = estado3 then 	-- estado 3
					
					Y_o <= "1000";
					
					if X_i = "00" then 
						estado <= estado3;
					elsif X_i = "01" then 
						estado <= estado2;
					elsif X_i = "10" then 
						estado <= estado0;
					elsif X_i = "11" then 
						estado <= estado3;
					end if;	
					
				end if;
				
			end if;	

		end process;
	
end Behavioral;









