library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFJK is
    Port ( J,K : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q_o : out STD_LOGIC);
end FFJK;

architecture Behavioral of FFJK is

signal Q : std_logic := '0'; 

begin

process (clk,J,K,Q)

begin
  
    if rising_edge (clk) then
    
		if J = '0' and K  = '0' then 
		
			Q <= Q;
		
		elsif	J = '0' and K  = '1' then 
		
			Q <= '0';
		
		elsif	J = '1' and K  = '0' then 
		
			Q <= '1';
			
		elsif	J = '1' and K  = '1' then 
		
			Q <= not Q;	
		
		end if;	
                  
    end if;
           
Q_o <= Q;
			  
end process;

end Behavioral;
