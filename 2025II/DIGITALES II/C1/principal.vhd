-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
	
		clk_i : in std_logic;
		pwm_o : out std_logic
		
	);
end principal;

architecture Behavioral of principal is

constant PERIODO_SIGNAL : integer := 50000;
constant DUTY_SIGNAL : integer := 12500;

signal contador : integer range 0 to 50e6 := 0;

begin

	process(clk_i)
	
	begin
	
		if rising_edge(clk_i) then


			if contador < PERIODO_SIGNAL then
				contador <= contador + 1;
			else
				contador <= 0;
			end if;
		
			if contador < DUTY_SIGNAL then
				pwm_o <= '1';
			elsif contador > DUTY_SIGNAL then
				pwm_o <= '0';
			end if;
	

		end if;	
				
	end process;
	
end Behavioral;



