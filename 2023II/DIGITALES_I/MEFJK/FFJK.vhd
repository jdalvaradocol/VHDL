-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity FFJK is
	port 
	(
		J_i, K_i, clk_i : in std_logic;
						Q_o : out std_logic
	);
end FFJK;

architecture Behavioral of FFJK is

signal Q : std_logic:= '0';

begin

	process(J_i, K_i, clk_i)
	
	begin
	
		if rising_edge (clk_i) then
		
			if (J_i = '0') and  (K_i = '0') then 
			
				Q  <= Q;
		
			elsif (J_i = '1') and  (K_i = '0') then 
			
				Q  <= '1';
				
			elsif (J_i = '0') and  (K_i = '1') then 
			
				Q  <= '0';
				
			elsif (J_i = '1') and  (K_i = '1') then 
			
				Q  <= not(Q);		
		
			end if;
			
		end if;
	
	end process;
	
Q_o <= Q;

end Behavioral;









