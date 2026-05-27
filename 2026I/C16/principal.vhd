-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_Std.all; 

entity principal is
	port 
	(
		   clk_i :  in std_logic;
		enable_i :  in std_logic;
	 	    WR_i :  in std_logic;
		   add_i	:  in std_logic_vector(3 downto 0);
		  data_i	:  in std_logic_vector(15 downto 0);
	 data_rom_o	: out std_logic_vector(15 downto 0);
    data_ram_o	: out std_logic_vector(15 downto 0)
	);
end principal;


architecture Behavioral of principal is

component ROM is
	port 
	(
		   clk_i :  in std_logic;
		enable_i :  in std_logic;
		   add_i	:  in std_logic_vector(3 downto 0);
		  data_o	: out std_logic_vector(15 downto 0)
	);
end component;

component RAM is
	port 
	(
		   clk_i :  in std_logic;
		enable_i :  in std_logic;
	 	    WR_i :  in std_logic;
		   add_i	:  in std_logic_vector(3 downto 0);
		  data_i	:  in std_logic_vector(15 downto 0);
		  data_o	: out std_logic_vector(15 downto 0)
	);
end component;

begin

	MROM: ROM port map
	(
		   clk_i => clk_i,   
		enable_i => enable_i,
		   add_i	=> add_i,
		  data_o => data_rom_o
	);

	MRAM: RAM port map
	(
		   clk_i => clk_i,   
		enable_i => enable_i,
			 WR_i => WR_i,
		   add_i	=> add_i,
		  data_i => data_i,
		  data_o => data_ram_o
	);
	
end Behavioral;






