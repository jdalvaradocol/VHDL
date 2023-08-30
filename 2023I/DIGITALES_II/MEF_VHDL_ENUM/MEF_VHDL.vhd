-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEF_VHDL is
	port 
	(
		clk_i, X_i : in  std_logic;
		Y_o		  : out std_logic_vector(2 downto 0);
		E_o		  : out std_logic_vector(1 downto 0)
		
	);
end MEF_VHDL;

architecture Behavioral of MEF_VHDL is


type estado_type is (Estado0, Estado1, Estado2, Estado3);
signal estado : estado_type := Estado0;


begin

	process(clk_i, X_i)
	
	begin
	
		if rising_edge (clk_i) then 
		
			if estado = Estado0 then 
				
				E_o <= "00";
				Y_o <= "001";

				if X_i = '0' then
					estado <= Estado1;
				elsif X_i = '1' then 
					estado <= Estado3;
				end if;	
			
			elsif estado = Estado1 then
		
				E_o <= "01";
				Y_o <= "010";

				if X_i = '0' then
					estado <= Estado2;
				elsif X_i = '1' then 
					estado <= Estado0;
				end if;	
		
			elsif estado = Estado2 then
		
				E_o <= "10";
				Y_o <= "100";

				if X_i = '0' then
					estado <= Estado3;
				elsif X_i = '1' then 
					estado <= Estado1;
				end if;	
		
			elsif estado = Estado3 then
		
				E_o <= "11";
				Y_o <= "110";

				if X_i = '0' then
					estado <= Estado0;
				elsif X_i = '1' then 
					estado <= Estado2;
				end if;
			
			end if;			
		
		end if;
	
	
	end process;

end Behavioral;






