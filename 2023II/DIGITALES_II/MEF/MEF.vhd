-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEF is
	port 
	(
		clk_i	: in  std_logic;
		  X_i : in  std_logic_vector(1 downto 0); 
		MEF_o : out std_logic_vector(1 downto 0); 
		  Y_o : out std_logic_vector(3 downto 0)
	);
end MEF;

architecture Behavioral of MEF is

signal estado : integer range 0 to 3 := 0;

begin

	process(clk_i)
	begin
	
		if rising_edge(clk_i) then
		
			if estado = 0 then -- Estado 0
			
				Y_o <= "0001";
				
				   if X_i = "00" then estado <= 0; -- Estado actual
				elsif X_i = "01" then estado <= 1; -- Estado siguiente
				elsif X_i = "10" then estado <= 3; -- Estado anterior
				elsif X_i = "11" then estado <= 0; -- Estado actual 
				end if;	
					
			elsif estado = 1 then -- Estado 1
			
				Y_o <= "0010";
				
				   if X_i = "00" then estado <= 1; -- Estado actual
				elsif X_i = "01" then estado <= 2; -- Estado siguiente
				elsif X_i = "10" then estado <= 0; -- Estado anterior
				elsif X_i = "11" then estado <= 1; -- Estado actual 
				end if;	
				 	
			elsif estado = 2 then -- Estado 2
			
				Y_o <= "0100";
				
				   if X_i = "00" then estado <= 2; -- Estado actual
				elsif X_i = "01" then estado <= 3; -- Estado siguiente
				elsif X_i = "10" then estado <= 1; -- Estado anterior
				elsif X_i = "11" then estado <= 2; -- Estado actual 
				end if;	
			
			elsif estado = 3 then -- Estado 3
			
				Y_o <= "1000";
				
				   if X_i = "00" then estado <= 3; -- Estado actual
				elsif X_i = "01" then estado <= 0; -- Estado siguiente
				elsif X_i = "10" then estado <= 2; -- Estado anterior
				elsif X_i = "11" then estado <= 3; -- Estado actual 
				end if;	
			
			end if;
			
		end if;
		
		end process;

MEF_o <= std_logic_vector(to_unsigned(estado, MEF_o'length));
		
end Behavioral;








