-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i, x_i : in std_logic;
		  estado_o : out std_logic_vector(2 downto 0)
	);
end principal;

architecture Behavioral of principal is

type mef_t is (S0, S1, S2, S3);
signal estado : mef_t := S0;

begin

	process(clk_i, x_i)
	
	begin
		
		if rising_edge (clk_i) then
	
			if estado = S0 then 
			
				estado_o <= "010";
				
				if x_i = '0' then		
					estado <= S1;	
				elsif x_i = '1' then
					estado <= S3;
				end if;
				
			elsif estado = S1 then 
			
				estado_o <= "011";
				
				if x_i = '0' then		
					estado <= S2;	
				elsif x_i = '1' then
					estado <= S0;
				end if;

			elsif estado = S2 then 
			
				estado_o <= "101";
				
				if x_i = '0' then		
					estado <= S3;	
				elsif x_i = '1' then
					estado <= S1;
				end if;			

			elsif estado = S3 then 
			
				estado_o <= "111";
				
				if x_i = '0' then		
					estado <= S0;	
				elsif x_i = '1' then
					estado <= S2;
				end if;		
		
			end if;
		
		end if;
		
	end process;
	
end Behavioral;




