-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity MEF is
	port 
	(
		clk_i	: in  std_logic;
		  x_i	: in  std_logic_vector(1 downto 0);
		MEF_o : out std_logic_vector(1 downto 0);
		  Y_o : out std_logic_vector(3 downto 0)
	);
end MEF;

architecture Behavioral of MEF is

type mef_type is (S0, S1, S2, S3);
signal estado : mef_type := S0;

begin

	process(clk_i, x_i)
	
	begin
	
		if rising_edge(clk_i) then
		
			if estado = S0 then
				
				Y_o <= "0001";
				MEF_o <= "00";
				
				   if ((x_i = "00") or (x_i = "11"))  then estado <= S0;
				elsif                  (x_i = "01")   then estado <= S3;
				elsif                  (x_i = "10")   then estado <= S1;
				end if;
				
			elsif estado = S1 then
				
				Y_o <= "0010";
				MEF_o <= "01";
				
				   if ((x_i = "00") or (x_i = "11"))  then estado <= S1;
				elsif                  (x_i = "01")   then estado <= S0;
				elsif                  (x_i = "10")   then estado <= S2;
				end if;
				
			elsif estado = S2 then
				
				Y_o <= "0100";
				MEF_o <= "10";
				
				   if ((x_i = "00") or (x_i = "11"))  then estado <= S2;
				elsif                  (x_i = "01")   then estado <= S1;
				elsif                  (x_i = "10")   then estado <= S3;
				end if;
	
			elsif estado = S3 then
				
				Y_o <= "1000";
				MEF_o <= "11";
				
				   if ((x_i = "00") or (x_i = "11"))  then estado <= S3;
				elsif                  (x_i = "01")   then estado <= S2;
				elsif                  (x_i = "10")   then estado <= S0;
				end if;
	
			end if;
		
		end if;	
			
	end process;

end Behavioral;








