-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM_ROM is
	generic
	(
		DATA_SIZE	: natural := 8; -- DATA = 8 bits
		 ADD_SIZE   : natural := 4  -- ADD = 16 posiciones de MEM_ROM		
	);
	port 
	(
		clk_i  :  in std_logic;
		add_i	 :  in std_logic_vector( ADD_SIZE - 1 downto 0);
		data_o : out std_logic_vector(DATA_SIZE - 1 downto 0) 
	);
end MEM_ROM;

architecture Behavioral of MEM_ROM is

subtype DATOS is std_logic_vector(DATA_SIZE - 1 downto 0);

type rom_type is array( 0 to (2**ADD_SIZE)-1) of DATOS; 

signal ROM: rom_type :=( 	x"01",x"02",x"04",x"08",
									x"10",x"20",x"40",x"80",
									x"C0",x"60",x"30",x"18",
									x"0C",x"06",x"03",x"81"
								);

begin

	process(clk_i,add_i)
	
	begin
		
		if rising_edge(clk_i) then
		
			data_o <= ROM(to_integer(unsigned(add_i)));
		
		end if;
		
	end process;	

end Behavioral;




