-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity principal is
	port 
	(
		clk_i  : in std_logic;
		duty_i : in std_logic_vector(6 downto 0);  
		pwm_o  : out std_logic	
	);
end principal;

architecture Behavioral of principal is

constant PERIODO_SIGNAL : integer := 50000;
constant DUTY_0  : integer := 0;
constant DUTY_25 : integer := 12500;
constant DUTY_50 : integer := 25000;
constant DUTY_75 : integer := 37500;

signal contador    : integer range 0 to 50e6 := 0;
signal duty_signal : integer range 0 to 50e6 := 0;
signal duty 		 : integer range 0 to 127 := 0;

begin

	process(clk_i)
	
	begin
	
	duty <= to_integer(unsigned(duty_i));
	
		if rising_edge(clk_i) then

			if contador < PERIODO_SIGNAL then
				contador <= contador + 1;
			else
				contador <= 0;
			end if;
		
			if duty = 0 then
				duty_signal <= DUTY_0;
			elsif duty = 25 then
				duty_signal <= DUTY_25;
			elsif duty = 50 then
				duty_signal <= DUTY_50;
			elsif duty = 75 then
				duty_signal <= DUTY_75;
			end if;	
		
			if contador < duty_signal then
				pwm_o <= '1';
			elsif contador > duty_signal then
				pwm_o <= '0';
			end if;
	

		end if;	
				
	end process;
	
end Behavioral;



