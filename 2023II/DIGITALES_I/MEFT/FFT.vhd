-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFT is
	port 
	(
		T_i, clk_i	:  in std_logic;
				 Q_o	: out std_logic 		
	);
end FFT;

architecture Behavioral of FFT is

signal Q	: std_logic := '0'; 

--  rising_edge --> Flanco de subida 
-- falling_edge --> Flanco de bajada

begin

	process(clk_i, T_i)
	
	begin
				
		  if (T_i = '0') and rising_edge(clk_i) then 
		
			Q <= Q;

		elsif (T_i = '1') and rising_edge(clk_i) then 
		
			Q <= not(Q);
		
		end if;
	
	end process;
	
Q_o <= Q;	

end Behavioral;









