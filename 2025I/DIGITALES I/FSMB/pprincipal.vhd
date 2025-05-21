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

type mef_t is (S0, S1, S2, S3, S4, S5, S6, S7);
signal estado : mef_t := S0;

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
			
			if estado = S0 then 
			
				salida_o <= "000";
				
				if x_i = '0' then
					estado <= S7;
				elsif x_i = '1' then
					estado <= S1;
				end if;	
		
			elsif estado = S1 then 
			
				salida_o <= "001";
				
				if x_i = '0' then
					estado <= S0;
				elsif x_i = '1' then
					estado <= S2;
				end if;		
			
			elsif estado = S2 then 
			
				salida_o <= "010";
				
				if x_i = '0' then
					estado <= S1;
				elsif x_i = '1' then
					estado <= S3;
				end if;	
				
			elsif estado = S3 then 
			
				salida_o <= "011";
				
				if x_i = '0' then
					estado <= S2;
				elsif x_i = '1' then
					estado <= S4;
				end if;					
				
			elsif estado = S4 then 
			
				salida_o <= "100";
				
				if x_i = '0' then
					estado <= S3;
				elsif x_i = '1' then
					estado <= S5;
				end if;			

			elsif estado = S5 then 
			
				salida_o <= "101";
				
				if x_i = '0' then
					estado <= S4;
				elsif x_i = '1' then
					estado <= S6;
				end if;	
				
			elsif estado = S6 then 
			
				salida_o <= "110";
				
				if x_i = '0' then
					estado <= S5;
				elsif x_i = '1' then
					estado <= S7;
				end if;	

			elsif estado = S7 then 
			
				salida_o <= "111";
				
				if x_i = '0' then
					estado <= S6;
				elsif x_i = '1' then
					estado <= S0;
				end if;	
			
			end if;
		
		end if;
				
	end process;
	
end Behavioral;



