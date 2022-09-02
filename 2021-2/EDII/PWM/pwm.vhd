-- Quartus II VHDL Template
-- Configurable gate architecture

library ieee;
use ieee.std_logic_1164.all;

entity pwm is
	port 
	(
		clk_i		 : in std_logic;
		periodo_i : in std_logic_vector(6 downto 0);
		ciclo_i	 : in std_logic_vector(6 downto 0);
		pwm_o		 : out std_logic
	);
end pwm;

architecture rtl of pwm is

signal aux, aux_on, aux_off  : integer range 0 to 500 := 0;
signal pwm : std_logic := '0';

begin

	pwm_mod:process(clk_i,periodo_i,ciclo_i)
	
	begin
	
		if rising_edge (clk_i) then
		
			aux <= aux + 1;
			
			if aux < aux_on then 
			
				pwm <= '1';
				
			elsif aux > aux_on then
			
				pwm <= '0';
				
			elsif  aux > aux_off then
			
				aux <= 0;
					
			end if;
			
		end if;
	
	end process;

	pulsadores:process(clk_i,periodo_i,ciclo_i)
	
	begin
	
		if rising_edge (clk_i) then
		
			if ciclo_i =  "0001110" then 
			
				aux_on  <= 250;  
				aux_off <= 500;
			
			elsif ciclo_i =  "0001101" then 
			
				aux_on  <= 125;  
				aux_off <= 500;		
			
			elsif ciclo_i =  "0001011" then 
			
				aux_on  <= 375;  
				aux_off <= 500;		
		
			elsif ciclo_i =  "0000111" then 
			
				aux_on  <= 300;  
				aux_off <= 500;	
			
			end if;
			
		end if;
	
	end process;

	pwm_o <= pwm;

end rtl;





