-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sumador is
	port 
	(
		       clk_i :  in std_logic;
		opA_i, opB_i :  in std_logic_vector(7 downto 0);
		       res_o : out std_logic_vector(7 downto 0)
		
	);
end Sumador;

architecture Behavioral of Sumador is

begin

	process(clk_i)
	begin
		if rising_edge(clk_i) then
			res_o <= std_logic_vector(unsigned(opA_i) + unsigned(opB_i));
		end if;
	end process;

end Behavioral;









