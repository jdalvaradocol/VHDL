-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RTL_REG is
	port 
	(
		clk_i 			:  in std_logic;
		data_ROM_A_o 	: out std_logic_vector(7 downto 0);
		data_ROM_B_o 	: out std_logic_vector(7 downto 0);
		resultado_o 	: out std_logic_vector(7 downto 0);
		res_o 			: out std_logic_vector(7 downto 0)
		

	);
end RTL_REG;

architecture Behavioral of RTL_REG is

signal		     WR :  std_logic;
signal contador_rom : std_logic_vector(4 downto 0);
signal contador_ram : std_logic_vector(4 downto 0);

signal data_ROM_A   : std_logic_vector(7 downto 0);
signal data_ROM_B   : std_logic_vector(7 downto 0);
signal resultado    : std_logic_vector(7 downto 0);

begin

	MEF_ints: entity work. MEF port map 
	(
		    clk_i =>  		  clk_i,
		     wr_o =>   		  WR,
		add_rom_o => contador_rom,
		add_ram_o => contador_ram
	);

	ROM_A_ints: entity work.ROM_A generic map
	(
		DATA_WIDTH => 8,
		 ADD_WIDTH => 5
	)
	port map
	(
		 clk_i => clk_i,
		 add_i => contador_rom,
		data_o => data_ROM_A
	);
	ROM_B_ints: entity work.ROM_B generic map
	(
		DATA_WIDTH => 8,
		 ADD_WIDTH => 5
	)
	port map
	(
		 clk_i => clk_i,
		 add_i => contador_rom,
		data_o => data_ROM_B
	);
	
	ope_ints: entity work.sumador port map 
	(
		clk_i =>      clk_i,
		opA_i => data_ROM_A,
		opB_i => data_ROM_B,  
		res_o => resultado
	);

	RAM_ints : entity work.RAM generic map
	(
		DATA_WIDTH => 8,
		 ADD_WIDTH => 5
	)
	port map
	(
		clk_i	=> clk_i,
		 wr_i	=> WR, 
		add_i	=> contador_ram,
	  data_i	=> resultado,
     data_o	=> res_o
	
	);
	
	data_ROM_A_o <= data_ROM_A;
	data_ROM_B_o <= data_ROM_B;
	resultado_o  <=  resultado; 
	
end Behavioral;


