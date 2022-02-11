
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity operaciones is
		port
		(
			clk_i  		: in	STD_LOGIC;
			clk_div_o  		: out	STD_LOGIC;
			--contador_ram	: out	STD_LOGIC_VECTOR( 3 downto 0);
			--contador_rom	: out	STD_LOGIC_VECTOR( 3 downto 0);
			--contador_restado	: out	STD_LOGIC_VECTOR( 3 downto 0);
			Resultado_o	: out	STD_LOGIC_VECTOR( 3 downto 0)

		);

end operaciones;

architecture behavioral of operaciones is   

component unidad_control is
		port
		(
			clk_i  		: in	STD_LOGIC;
			Rom_A_add_o	: out	STD_LOGIC_VECTOR( 2 downto 0);
			clk_rom_A_o : out	STD_LOGIC;
			Rom_B_add_o	: out	STD_LOGIC_VECTOR( 2 downto 0);
			clk_rom_B_o : out	STD_LOGIC;
			Operacion_o	: out	STD_LOGIC_VECTOR( 1 downto 0);
			Ram_add_o	: out	STD_LOGIC_VECTOR( 2 downto 0);
			WR_o  		: out	STD_LOGIC;
			clk_ram_o  	: out	STD_LOGIC
		);

end component;

component ROM_A is

		generic
		(
			DATA_WH : natural := 4;
			 ADD_WH : natural := 3
		);
		
		port
		(
			CLK	: in	STD_LOGIC;
			ADD	: in	STD_LOGIC_VECTOR( (ADD_WH) - 1 downto 0);
			DATA	: out	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0)
		);

end component;

component ROM_B is

		generic
		(
			DATA_WH : natural := 4;
			 ADD_WH : natural := 3
		);
		
		port
		(
			CLK	: in	STD_LOGIC;
			ADD	: in	STD_LOGIC_VECTOR( (ADD_WH) - 1 downto 0);
			DATA	: out	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0)
		);

end component;

 component ALU is
		port
		(
			Dato_A_i	  	: in	STD_LOGIC_VECTOR( 3 downto 0);
			Dato_B_i	  	: in	STD_LOGIC_VECTOR( 3 downto 0);
			Operacion_i	: in	STD_LOGIC_VECTOR( 1 downto 0);
			Dato_o		: out	STD_LOGIC_VECTOR( 3 downto 0)
		);

end component;

component RAM is

		generic
		(
			DATA_WH : natural := 4;
			 ADD_WH : natural := 3
		);
		
		port
		(
			CLK	: in	STD_LOGIC;
			 WR	: in	STD_LOGIC;
			ADD	: in	STD_LOGIC_VECTOR( (ADD_WH) - 1 downto 0);
		DATA_IN	: in	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0);
		DATA_OUT	: out	STD_LOGIC_VECTOR((DATA_WH) - 1 downto 0)
	
	);

end component;

signal Rom_A_add	: 	STD_LOGIC_VECTOR( 2 downto 0) := "000";
signal clk_rom_A 	: 	STD_LOGIC  							:= '0';
signal Rom_B_add	: 	STD_LOGIC_VECTOR( 2 downto 0) := "000";
signal clk_rom_B 	: 	STD_LOGIC  							:= '0';
signal Operacion	: 	STD_LOGIC_VECTOR( 1 downto 0) := "00";
signal Ram_add		: 	STD_LOGIC_VECTOR( 2 downto 0) := "000";
signal WR  			: 	STD_LOGIC  							:= '0';
signal clk_ram  	: 	STD_LOGIC  							:= '0';

signal Dato_A		: 	STD_LOGIC_VECTOR( 3 downto 0) := "0000";
signal Dato_B		: 	STD_LOGIC_VECTOR( 3 downto 0) := "0000";
signal Dato			: 	STD_LOGIC_VECTOR( 3 downto 0) := "0000";


begin

	unidad_control_ope: unidad_control port map
		(
					clk_i =>   	 clk_i,
			Rom_A_add_o	=> Rom_A_add,
			clk_rom_A_o => clk_rom_A,
			Rom_B_add_o	=> Rom_B_add,
			clk_rom_B_o => clk_rom_B,
			Operacion_o	=> Operacion,
			Ram_add_o	=>   Ram_add,
			WR_o  		=>        WR,
			clk_ram_o  	=>   clk_ram
		);
		
	ROM_A_ope:  ROM_A port map
		(
			CLK	=> clk_rom_A,
			ADD	=> Rom_A_add,
			DATA	=> Dato_A
		);

	ROM_B_ope:  ROM_B port map
		(
			CLK	=> clk_rom_B,
			ADD	=> Rom_B_add,
			DATA	=> Dato_B
		);
		
	ALU_ope: ALU  port map
		(
			Dato_A_i	  	=> Dato_A,
			Dato_B_i	  	=> Dato_B,
			Operacion_i	=> Operacion,
			Dato_o		=> Dato
		);
	

		RAM_ope: RAM port map
		(
			CLK		=> clk_ram,
			 WR		=> WR,
			ADD		=> Ram_add,
			DATA_IN	=> Dato,
			DATA_OUT	=> Resultado_o
		);
		
		clk_div_o <= clk_ram ;
		
		--contador_ram	<= Ram_add;
		--contador_rom	<= Rom_B_add;
		--contador_restado <= clk_ram
	
end behavioral;
	