-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_Std.all; 


entity RAM is
	port 
	(
		   clk_i :  in std_logic;
		enable_i :  in std_logic;
	 	    WR_i :  in std_logic;
		   add_i	:  in std_logic_vector(1 downto 0);
		  data_i	:  in std_logic_vector(7 downto 0);
		  data_o	: out std_logic_vector(7 downto 0)
	);
end RAM;

architecture Behavioral of RAM is

subtype DATOS is std_logic_vector(7 downto 0);
type ram_type is array (0 to 3) of DATOS;

signal MEM: ram_type := (  x"00", x"00",x"00", x"00");
   
begin

	process(clk_i, enable_i, WR_i)
	
	begin
		
		if enable_i = '1' then

			if rising_edge(clk_i) then
		
				if WR_i = '1' then -- Modo Lectura
					data_o <= MEM(to_integer(unsigned(add_i)));
				elsif WR_i = '0' then -- Modo Escritura
					MEM(to_integer(unsigned(add_i))) <= data_i;
				end if;
			
			end if;
			
		end if;	
		
	end process;
	
end Behavioral;
