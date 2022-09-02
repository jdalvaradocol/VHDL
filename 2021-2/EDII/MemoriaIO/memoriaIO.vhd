
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoriaIO is
		port
		(
		   clk_i : in	std_logic;
   		 sw_i	: in	std_logic_vector(7 downto 0);
		  leds_o	: out	std_logic_vector(7 downto 0)	
	);

end memoriaIO;

architecture behavioral of memoriaIO is   

component Memoria_RAM is

		generic
		(
			DATA_WH : natural := 8;
			 ADD_WH : natural := 2
		);
		
		port
		(
			CLK	: in	STD_LOGIC;
			 WR	: in	STD_LOGIC;
		 ADD_i	: in	STD_LOGIC_VECTOR( (ADD_WH) - 1 downto 0);
		DATA_IN	: in	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0);
		  ADD_o	: out	STD_LOGIC_VECTOR( (ADD_WH) - 1 downto 0);
		DATA_OUT	: out	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0)
	
	);

end component;

component unidad_control is
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

end component;

component leds is
		port
		(
				   clk_i : in	std_logic;
			  add_ram_i	: in	std_logic_vector(1 downto 0);
			 data_ram_i	: in	std_logic_vector(7 downto 0);
				  leds_o	: out	std_logic_vector(7 downto 0)
			
	);

end component;

signal clk_div 	: std_logic; 
signal WR 			: std_logic; 
signal add_ram		: std_logic_vector(1 downto 0);
signal add_ram_l	: std_logic_vector(1 downto 0);

signal data_ram	: std_logic_vector(7 downto 0);
signal data			: std_logic_vector(7 downto 0);
		
begin

control: unidad_control port map
		(
				clk_i	=> clk_i,
				clk_o	=> clk_div,
				WR_o	=> WR,
		  add_ram_o	=> add_ram,
		  data_sw_i	=> sw_i,
		 data_ram_i	=> data_ram,
			  data_o	=> data	
		);
	
memoria: memoria_RAM port map
		(
			CLK		=> clk_div,
			WR			=> WR,
			ADD_i		=> add_ram,
			DATA_IN	=> data,
			ADD_o		=> add_ram_l,
			DATA_OUT	=> data_ram
);
		
salida: leds port map
		(
				   clk_i => clk_div,
			  add_ram_i	=> add_ram_l,
			 data_ram_i	=> data_ram,
				  leds_o	=> leds_o
			
		);
	
end behavioral;
