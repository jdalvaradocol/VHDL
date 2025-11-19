-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM_RAM is
	generic
	(
		DATA_SIZE	: natural := 8; -- DATA = 8 bits
		 ADD_SIZE   : natural := 4  -- ADD = 16 posiciones de MEM_ROM		
	);
	port 
	(
		clk_i  :  in std_logic;
		 WR_i  :  in std_logic;
		add_i	 :  in std_logic_vector( ADD_SIZE - 1 downto 0);
		data_i :  in std_logic_vector(DATA_SIZE - 1 downto 0); 
		data_o : out std_logic_vector(DATA_SIZE - 1 downto 0) 
	);
end MEM_RAM;

architecture Behavioral of MEM_RAM is

subtype DATOS is std_logic_vector(DATA_SIZE - 1 downto 0);

type ram_type is array( 0 to (2**ADD_SIZE)-1) of DATOS; 

signal RAM: ram_type :=( 	x"01",x"02",x"04",x"08",
									x"10",x"20",x"40",x"80",
									x"C0",x"60",x"30",x"18",
									x"0C",x"06",x"03",x"81"
								);

begin

	process(clk_i,add_i, WR_i)
	
	begin
		
		if rising_edge(clk_i) then
		
			if    WR_i = '0' then -- WR = 0  Modo lectura
		
				data_o <= RAM(to_integer(unsigned(add_i)));
		
			elsif WR_i = '1' then -- WR = 1  Modo escritura
	
				RAM(to_integer(unsigned(add_i))) <= data_i;
		
			end if;
		
		end if;
		
	end process;	

end Behavioral;




