library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity unidad_control is
		port
		(
			clk_i	: in	STD_LOGIC;
			clk_o	: out	STD_LOGIC;
			WR_o	: out	STD_LOGIC;
	  add_ram_o	: out	STD_LOGIC_VECTOR(1 downto 0);
	  data_sw_i	: in	STD_LOGIC_VECTOR(7 downto 0);
	 data_ram_i	: in	STD_LOGIC_VECTOR(7 downto 0);
		  data_o	: out	STD_LOGIC_VECTOR(7 downto 0)
	
	);

end unidad_control;

architecture behavioral of unidad_control is   

signal estado : integer := 0; 

signal operacion : integer := 0; 


begin
	
	process(clk_i,data_sw_i,data_ram_i)

	begin
	
		if rising_edge(clk_i) then
		
		
			if estado < 1 then
			
				add_ram_o <= "01";
				WR_o <= '0';
				estado <= estado + 1;
								
			elsif	estado < 3 then

				add_ram_o <= "00";
				WR_o <= '1';
				data_o <= data_sw_i;
				estado <= estado + 1;
					
			elsif	estado < 5 then
			
				add_ram_o <= "00";
				WR_o <= '0';
				data_o <= "00000000";
				estado <= estado + 1;
				
		   elsif	estado < 7 then
			
				operacion <= conv_integer(data_ram_i) + 10;
				estado <= estado + 1;
				
			elsif	estado < 9 then
			
				add_ram_o <= "01";
				WR_o <= '1';
				data_o <= std_logic_vector(to_unsigned(operacion,data_o'length));
				estado <= estado + 1;							

			elsif	estado < 11 then
				
				add_ram_o <= "11";
				WR_o <= '0';
				data_o <= "00000000";
				estado <= 0;
			   operacion<=0;
				
			end if;
			
		end if;
	
	end process;

	clk_o <= clk_i;
	
end behavioral;