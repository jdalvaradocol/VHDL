-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i : in std_logic;
		x_i : in std_logic_vector(1 downto 0);
		s_o : out std_logic_vector(1 downto 0);
		T_o : out std_logic
		
	);
end principal;

architecture Behavioral of principal is

signal estado : integer range 0 to 3 := 0; 

begin

	process(clk_i,x_i)
	
	begin
	
		if rising_edge (clk_i) then
		
			if estado = 0 then
			
				S_o <= "00";
				T_o <= '1';
				
				if x_i = "00" then
					estado <= 1;
				elsif x_i = "01" then
					estado <= 3;
				elsif x_i = "10" then
					estado <= 1;
				elsif x_i = "11" then
					estado <= 3;
				end if;
		
			elsif estado = 1 then
			
				S_o <= "10";
				T_o <= '1';
				
				if x_i = "00" then
					estado <= 2;
				elsif x_i = "01" then
					estado <= 0;
				elsif x_i = "10" then
					estado <= 1;
				elsif x_i = "11" then
					estado <= 3;
				end if;
		
		
			elsif estado = 2 then
			
				S_o <= "11";
				T_o <= '0';
				
				if x_i = "00" then
					estado <= 3;
				elsif x_i = "01" then
					estado <= 1;
				elsif x_i = "10" then
					estado <= 1;
				elsif x_i = "11" then
					estado <= 3;	
				end if;

			elsif estado = 3 then
			
				S_o <= "01";
				T_o <= '0';
				
				if x_i = "00" then
					estado <= 0;
				elsif x_i = "01" then
					estado <= 2;
				elsif x_i = "10" then
					estado <= 1;
				elsif x_i = "11" then
					estado <= 3;	
				end if;

			end if;

		end if;
	
	end process;
	
end Behavioral;











