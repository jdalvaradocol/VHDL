-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, X_i :  in	std_logic;
				 Q_o : out	std_logic_vector(2 downto 0) 	
	);
end principal;

architecture Behavioral of principal is

type mef_t is (S0, S1, S2, S3, S4, S5, S6, S7);

signal estado : mef_t := S0;

begin

	process(clk_i, X_i)
	
	begin
	
		if rising_edge(clk_i) then
		
			if estado = S0 then
			
				Q_o <= "000";
				
				if    X_i = '0' then estado <= S7;
				elsif X_i = '1' then estado <= S1;
				end if;
				
			elsif estado = S1 then
			
				Q_o <= "001";
				
				if    X_i = '0' then estado <= S0;
				elsif X_i = '1' then estado <= S2;
				end if;
		
			elsif estado = S2 then
			
				Q_o <= "010";
				
				if    X_i = '0' then estado <= S1;
				elsif X_i = '1' then estado <= S3;
				end if;
				
			elsif estado = S3 then
			
				Q_o <= "011";
				
				if    X_i = '0' then estado <= S2;
				elsif X_i = '1' then estado <= S4;				
				end if;
			
			elsif estado = S4 then
			
				Q_o <= "100";
				
				if    X_i = '0' then estado <= S3;
				elsif X_i = '1' then estado <= S5;
				end if;
			
			elsif estado = S5 then
			
				Q_o <= "101";
				
				if    X_i = '0' then estado <= S4;
				elsif X_i = '1' then estado <= S6;
				end if;
					
			elsif estado = S6 then
			
				Q_o <= "110";
				
				if    X_i = '0' then estado <= S5;
				elsif X_i = '1' then estado <= S7;
				end if;
				
			elsif estado = S7 then
			
				Q_o <= "111";
				
				if    X_i = '0' then estado <= S6;
				elsif X_i = '1' then estado <= S0;
				end if;	
						
			end if;
			
		end if;

	end process;			
						
end Behavioral;









