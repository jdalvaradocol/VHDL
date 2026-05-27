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
		  data_o	: out std_logic_vector(15 downto 0)
	);
end ROM;

architecture Behavioral of ROM is

subtype DATOS is std_logic_vector(15 downto 0);
type rom_type is array (0 to 15) of DATOS;

signal MEM: rom_type := (  x"1234", x"1478",x"7895", x"4587",
									x"4625", x"1236",x"8520", x"9630",
									x"3256", x"5821",x"4125", x"7855",
									x"9632", x"2365",x"1254", x"9658");
   
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






