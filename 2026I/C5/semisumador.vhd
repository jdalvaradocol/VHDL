-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity semisumador is
	port 
	(
		A_i, B_i : in std_logic;
		C_o, S_o : out std_logic
	);
end semisumador;

architecture Behavioral of semisumador is

signal entrada : std_logic_vector(1 downto 0):= "00"; 

begin
	
	entrada <= A_i & B_i;
	
	S_o <= 	'0' when entrada = "00" else
				'1' when entrada = "01" else
				'1' when entrada = "10" else
				'0' when entrada = "11" else
				'0';
				
	C_o <= 	'0' when entrada = "00" else
				'0' when entrada = "01" else
				'0' when entrada = "10" else
				'1' when entrada = "11" else
				'0';
		
end Behavioral;






