-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_C is
	port 
	(
		A_i, B_i, C_i, D_i : in std_logic;
		S_i					 : in std_logic_vector(1 downto 0);
		x_o 					 : out std_logic
			
	);
end mux4x1_C;

architecture Behavioral of mux4x1_C is

begin
	
	process(S_i, A_i, B_i, C_i, D_i)
	
	begin
	
		if(S_i = "00") then
			x_o <= A_i;
		elsif(S_i = "01") then
			x_o <= B_i;
		elsif(S_i = "10") then
			x_o <= C_i;
		elsif(S_i = "11") then
			x_o <= D_i;
		else
			x_o <= '0';
		end if;
			
	end process;
	
end Behavioral;