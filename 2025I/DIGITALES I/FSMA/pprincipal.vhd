-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity pprincipal is
	port 
	(
		clk_i, x_i :  in std_logic;
		  salida_o : out std_logic_vector(2 downto 0)
	);
end pprincipal;

architecture Behavioral of pprincipal is

component clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end component;

signal estado : integer range 0 to 7 := 0; 

signal clk_dv : std_logic:='0';

begin
	
	clk_div : clk port map
	(
		    clk_i =>  clk_i,
		clk_div_o => clk_dv
	);

	process (clk_i, x_i, clk_dv)
	
	begin
	
		if rising_edge(clk_dv) then
			
			if estado = 0 then 
			
				salida_o <= "000";
				
				if x_i = '0' then
					estado <= 7;
				elsif x_i = '1' then
					estado <= 1;
				end if;	
		
			elsif estado = 1 then 
			
				salida_o <= "001";
				
				if x_i = '0' then
					estado <= 0;
				elsif x_i = '1' then
					estado <= 2;
				end if;		
			
			elsif estado = 2 then 
			
				salida_o <= "010";
				
				if x_i = '0' then
					estado <= 1;
				elsif x_i = '1' then
					estado <= 3;
				end if;	
				
			elsif estado = 3 then 
			
				salida_o <= "011";
				
				if x_i = '0' then
					estado <= 2;
				elsif x_i = '1' then
					estado <= 4;
				end if;					
				
			elsif estado = 4 then 
			
				salida_o <= "100";
				
				if x_i = '0' then
					estado <= 3;
				elsif x_i = '1' then
					estado <= 5;
				end if;			

			elsif estado = 5 then 
			
				salida_o <= "101";
				
				if x_i = '0' then
					estado <= 4;
				elsif x_i = '1' then
					estado <= 6;
				end if;	
				
			elsif estado = 6 then 
			
				salida_o <= "110";
				
				if x_i = '0' then
					estado <= 5;
				elsif x_i = '1' then
					estado <= 7;
				end if;	

			elsif estado = 7 then 
			
				salida_o <= "111";
				
				if x_i = '0' then
					estado <= 6;
				elsif x_i = '1' then
					estado <= 0;
				end if;	
			
			end if;
		
		end if;
				
	end process;
	
end Behavioral;



