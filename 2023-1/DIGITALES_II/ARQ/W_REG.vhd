-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity W_REG is
	port 
	(
			clk_i 		:	in std_logic;
			wr_i :  in std_logic;
			Dato_in_i	:  in std_logic_vector(3 downto 0);
			Dato_out_o	: out std_logic_vector(3 downto 0)
			
);
end W_REG;

architecture rtl of W_REG is

begin
		
		process(clk_i,wr_i,Dato_in_i)
		
		begin

			if rising_edge(clk_i) then
			
				if wr_i = '1' then
			
					Dato_out_o <= Dato_in_i;
				
				end if;
				
			end if;
		
		end process;
		

end rtl;
