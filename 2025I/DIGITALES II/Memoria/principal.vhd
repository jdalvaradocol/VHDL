-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		     clk_i : in  std_logic;
           WR_i  : in  std_logic;
		     add_i : in  std_logic_vector( 4 downto 0);
 		    data_i : in  std_logic_vector( 7 downto 0);
		data_ram_o : out std_logic_vector( 7 downto 0);
		data_rom_o : out std_logic_vector( 7 downto 0)
	);
end principal;

architecture Behavioral of principal is

component ROM is
	generic
	(
		DATA_WIDTH : natural := 8; -- Tamaño del numero de bits
		 ADD_WIDTH : natural := 5  -- Numero de posiciones de memoria en 2^n -> n = ADD_WIDTH
	);
	port 
	(
		 clk_i : in  std_logic;
		 add_i : in  std_logic_vector( ADD_WIDTH-1 downto 0);
		data_o : out std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end component;

component RAM is
	generic
	(
		DATA_WIDTH : natural := 8; -- Tamaño del numeor de bits
		 ADD_WIDTH : natural := 5  -- Numero de posiciones de memoria en 2^n -> n = ADD_WIDTH
	);
	port 
	(
		 clk_i :  in  std_logic;
		  WR_i :  in  std_logic;
		 add_i :  in  std_logic_vector( ADD_WIDTH-1 downto 0);
		data_i :  in  std_logic_vector(DATA_WIDTH-1 downto 0);
		data_o : out  std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end component;


begin

	MEM_ROM: ROM generic map
	(
		DATA_WIDTH  => 8, 
		ADD_WIDTH	=> 5
	)
	port map
	(
		clk_i 	=> clk_i,
		add_i		=> add_i,
		data_o	=> data_rom_o	
	);

	MEM_RAM: RAM generic map
	(
		DATA_WIDTH  => 8, 
		ADD_WIDTH	=> 5
	)
	port map
	(
		clk_i 	=>  clk_i,
		WR_i		=>   WR_i,
		add_i		=>  add_i,
		data_i	=> data_i,
		data_o	=> data_ram_o	
	);

end Behavioral;