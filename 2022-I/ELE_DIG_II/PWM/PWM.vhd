-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity pwm is
	port 
	(
		clk_i 	 : in  	std_logic;
		entrada_i : in 	std_logic_vector(1 downto 0);
		Led_o     : out  	std_logic;
		PWM_o     : out  	std_logic
	);
end pwm;

architecture Behavioral of pwm is

constant periodo : integer := 500;

signal   dutty  		: integer range 0 to 500 := 0;
signal contador 		: integer range 0 to 500 := 0;

signal contador_div 	: integer range 0 to 10000000 := 0;
signal div			 	: std_logic := '0';

 
begin

	process(clk_i, entrada_i)
	
	begin
	
			if rising_edge(clk_i) then
			
				if entrada_i = "00" then	-- 20%
					
					dutty <= 99;
			
				elsif entrada_i = "01" then	-- 40%
					
					dutty <= 199;
					
				elsif entrada_i = "10" then -- 60%
					
					dutty <= 299;	
			
				elsif entrada_i = "11" then -- 80%
					
					dutty <= 399;
			
				end if;
				
				if	contador < dutty then
			
					PWM_o <= '1';
					contador <= contador + 1;
					
				elsif	contador < periodo then 
			
					PWM_o <= '0';
					contador <= contador + 1;
				
				elsif contador = periodo then
				
					contador <= 0;
										
				end if;
				
			end if;
		
	end process;
	
	
	clk_div :process(clk_i)
	
	begin
	
		if rising_edge(clk_i) then
			
			Contador_div <= Contador_div + 1; 
			
			if Contador_div = 10000000 then
				
				div <= not div;
			
			end if;

		end if;
			
	end process;
	
	Led_o <= div;	

end Behavioral;