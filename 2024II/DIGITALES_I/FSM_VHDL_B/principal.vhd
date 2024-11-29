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

type mef_t is (S0, S1, S2, S3);

signal estado : mef_t := S3;

begin

	process(clk_i,x_i)
	
	begin
	
		if rising_edge (clk_i) then
		
			if estado = S0 then
			
				S_o <= "00";
				T_o <= '1';
				
				if x_i = "00" then
					estado <= S1;
				elsif x_i = "01" then
					estado <= S3;
				elsif x_i = "10" then
					estado <= S1;
				elsif x_i = "11" then
					estado <= S3;
				end if;
		
			elsif estado = S1 then
			
				S_o <= "10";
				T_o <= '1';
				
				if x_i = "00" then
					estado <= S2;
				elsif x_i = "01" then
					estado <= S0;
				elsif x_i = "10" then
					estado <= S1;
				elsif x_i = "11" then
					estado <= S3;
				end if;
		
			elsif estado = S2 then
			
				S_o <= "11";
				T_o <= '0';
				
				if x_i = "00" then
					estado <= S3;
				elsif x_i = "01" then
					estado <= S1;
				elsif x_i = "10" then
					estado <= S1;
				elsif x_i = "11" then
					estado <= S3;	
				end if;

			elsif estado = S3 then
			
				S_o <= "01";
				T_o <= '0';
				
				if x_i = "00" then
					estado <= S0;
				elsif x_i = "01" then
					estado <= S2;
				elsif x_i = "10" then
					estado <= S1;
				elsif x_i = "11" then
					estado <= S3;	
				end if;

			end if;

		end if;
	
	end process;
	
end Behavioral;











