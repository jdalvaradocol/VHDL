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

signal estado : integer range 0 to 3 := 0; 

begin

	process(clk_i, x_i)
	
	begin
		
		if rising_edge (clk_i) then
	
			if estado = 0 then 
			
				estado_o <= "010";
				
				if x_i = '0' then		
					estado <= 1;	
				elsif x_i = '1' then
					estado <= 3;
				end if;
				
			elsif estado = 1 then 
			
				estado_o <= "011";
				
				if x_i = '0' then		
					estado <= 2;	
				elsif x_i = '1' then
					estado <= 0;
				end if;

			elsif estado = 2 then 
			
				estado_o <= "101";
				
				if x_i = '0' then		
					estado <= 3;	
				elsif x_i = '1' then
					estado <= 1;
				end if;			

			elsif estado = 3 then 
			
				estado_o <= "111";
				
				if x_i = '0' then		
					estado <= 0;	
				elsif x_i = '1' then
					estado <= 2;
				end if;		
		
			end if;
		
		end if;
		
	end process;
	
end Behavioral;




