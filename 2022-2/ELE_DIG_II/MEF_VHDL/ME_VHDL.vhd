-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity ME_VHDL is
	port 
	(
		clk_i, x_i :  in std_logic;
				 y_o : out std_logic;
		  salida_o : out std_logic_vector(1 downto 0)
	);
end ME_VHDL;

architecture Behavioral of ME_VHDL is

signal estado : integer range 0 to 3 := 0;

begin

	process(clk_i, x_i)
	
	begin
	
		if rising_edge(clk_i) then
			
			if estado = 0 then
			
				y_o <= '1';
			
				if    x_i = '0' then
					estado <= 0;
				elsif x_i = '1' then
					estado <= 1;
				end if;
			
			elsif estado = 1 then
			
				y_o <= '0';
			
				if    x_i = '0' then
					estado <= 0;
				elsif x_i = '1' then
					estado <= 2;
				end if;
				
			elsif estado = 2 then
			
				y_o <= '1';
			
				if    x_i = '0' then
					estado <= 0;
				elsif x_i = '1' then
					estado <= 3;
				end if;

			elsif estado = 3 then
			
				y_o <= '0';
			
				if    x_i = '0' then
					estado <= 0;
				elsif x_i = '1' then
					estado <= 3;
				end if;			
				
			end if;
			
		end if;
		
	end process;

salida_o <= std_logic_vector(to_unsigned(estado, salida_o'length));
	
end Behavioral;


