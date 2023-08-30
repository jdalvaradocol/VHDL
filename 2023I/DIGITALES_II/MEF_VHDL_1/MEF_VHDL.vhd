-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEF_VHDL is
	port 
	(
		clk_i, X_i : in  std_logic;
		E_o		  : out std_logic_vector(7 downto 0)
		
	);
end MEF_VHDL;

architecture Behavioral of MEF_VHDL is

signal contador : integer range 0 to 7:= 0;

begin

	process(clk_i, X_i)
	
	begin
	
		if rising_edge (clk_i) then 
		
		
			if X_i = '0' then
			
				contador <= contador + 1;
			
			elsif X_i = '1' then
			
				contador <= contador - 1;
			
			end if;
		
		end if;
	
	
	end process;

E_o <=  std_logic_vector(to_unsigned(contador,E_o'length));

end Behavioral;






