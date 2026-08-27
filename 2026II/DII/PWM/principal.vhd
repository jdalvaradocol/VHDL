-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i		  : in std_logic;
		pwm_duty_i : in std_logic_vector(3 downto 0);
		pwm_o		  : out std_logic
		
	);
end principal;

architecture Behavioral of principal is

constant PERIODO_SIGNAL  : integer := 50000;
constant PERIODO_DUTY_25 : integer := 12500;
constant PERIODO_DUTY_50 : integer := 25000;
constant PERIODO_DUTY_75 : integer := 37500;

signal contador    : integer range 0 to 50e6 := 0;
signal duty_signal : integer range 0 to 50e6 := 0;
signal duty        : integer range 0 to   15 := 0;


begin

	process(clk_i, pwm_duty_i)
	
	begin
	
		if rising_edge(clk_i) then
			
			if contador < PERIODO_SIGNAL then
				contador <= contador + 1;
			else
				contador <= 0;
			end if;
			
			if pwm_duty_i = "0000" then
				duty_signal <= 0;
			elsif pwm_duty_i = "0001" then
				duty_signal <= PERIODO_DUTY_25;
			elsif pwm_duty_i = "0010" then
				duty_signal <= PERIODO_DUTY_50;
			elsif pwm_duty_i = "0011" then
				duty_signal <= PERIODO_DUTY_75;
			end if;
			
			if contador <= duty_signal then
				pwm_o <= '1';
			else 
				pwm_o <= '0';
			end if;
			
		end if;
	
	
	end process;
	
end Behavioral;






