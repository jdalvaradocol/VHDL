library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFJK is
    Port ( J_i,K_i : in std_logic;
           clk_i : in std_logic;
           Q_o : out std_logic);
end FFJK;

architecture Behavioral of FFJK is

signal Q : std_logic := '0'; 

begin

process (clk_i,J_i,K_i,Q)

begin
  
    if rising_edge (clk_i) then
    
		if J_i = '0' and K_i  = '0' then 
		
			Q <= Q;
		
		elsif	J_i = '0' and K_i  = '1' then 
		
			Q <= '0';
		
		elsif	J_i = '1' and K_i  = '0' then 
		
			Q <= '1';
			
		elsif	J_i = '1' and K_i = '1' then 
		
			Q <= not Q;	
		
		end if;	
                  
    end if;
           
Q_o <= Q;
			  
end process;

end Behavioral;
