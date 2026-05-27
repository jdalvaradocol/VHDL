-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_Std.all; 


entity ROM is
	port 
	(
		   clk_i :  in std_logic;
		enable_i :  in std_logic;
		   add_i	:  in std_logic_vector(3 downto 0);
		  data_o	: out std_logic_vector(7 downto 0)
	);
end ROM;

architecture Behavioral of ROM is

subtype DATOS is std_logic_vector(7 downto 0);
type rom_type is array (0 to 15) of DATOS;

signal MEM: rom_type := (  x"01", x"02",x"03", x"04",
									x"05", x"06",x"07", x"08",
									x"09", x"0A",x"0B", x"0C",
									x"0D", x"0E",x"0F", x"10");
   
begin

	process(clk_i, enable_i)
	
	begin
		
		if enable_i = '1' then
			
			if rising_edge(clk_i) then
				
				data_o <= MEM(to_integer(unsigned(add_i)));
		
			end if;
			
		end if;
		
	end process;
	
end Behavioral;






