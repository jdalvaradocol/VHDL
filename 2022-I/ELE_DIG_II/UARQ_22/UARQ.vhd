-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity UARQ is
	port 
	(
		  clk_i	:  in std_logic;
		reset_i	:  in std_logic;
		 leds_o	: out std_logic_vector(3 downto 0)
);
end UARQ;


architecture rtl of UARQ is

component unidad_control is
	port
	(
		clk_i, reset_i		 	 				 : in	 std_logic;
		data_rom_i				 				 : in	 std_logic_vector(7 downto 0);
		data_ram_i				 				 : in	 std_logic_vector(3 downto 0);
		entradaALU_i			    			 : in	 std_logic_vector(3 downto 0);
		clk_o, WR_o, habilitar_i			 : out std_logic;
		ope_ALU_o				 				 : out std_logic_vector(1 downto 0);
		salidaALU_o, W_o, RAM_o	 : out std_logic_vector(3 downto 0);		
		add_ram_o, add_rom_o  				 : out std_logic_vector(1 downto 0)
	);
end component;

signal data_rom			 				: std_logic_vector(7 downto 0);
signal data_ram_in, data_ram_out		: std_logic_vector(3 downto 0);
signal clk, WR 			 				: std_logic;
signal ope_ALU				 				: std_logic_vector(1 downto 0);
signal salidaALU, data	 				: std_logic_vector(3 downto 0);		
signal add_ram, add_rom  				: std_logic_vector(1 downto 0);

component MEM_ROM is

    generic
    (
        DATA_WIDTH :  natural  := 0;
        ADD_WIDTH :   natural  := 0
    );

    Port ( ADD_i : in STD_LOGIC_VECTOR ((ADD_WIDTH - 1) downto 0);
           DATA_o : out STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
           clk_i : in STD_LOGIC);
end component;

component MEM_RAM is

    generic
    (
        DATA_WIDTH :  natural  := 8;
        ADD_WIDTH :   natural  := 5
    );

    Port ( ADD_i 	: in 	STD_LOGIC_VECTOR ((ADD_WIDTH - 1) downto 0);
           DATA_i : in 	STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
			  DATA_o : out STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
           WR_i 	: in 	STD_LOGIC;
			  clk_i 	: in 	STD_LOGIC
			  );
end component;

component ALU is
	port 
	(
		operacaion_i	:  in std_logic_vector(1 downto 0);
		Dato_RL_i		:  in std_logic_vector(3 downto 0);
		Dato_W_i			:  in std_logic_vector(3 downto 0);
		Dato_o			: out std_logic_vector(3 downto 0)
		
);
end component;

signal Dato_W		: std_logic_vector(3 downto 0);
signal Dato			: std_logic_vector(3 downto 0);

component W_REG is
	port 
	(
			clk_i 		:	in std_logic;
			Habilitar_i	:  in std_logic;
			Dato_in_i	:  in std_logic_vector(3 downto 0);
			Dato_out_o	: out std_logic_vector(3 downto 0)
			
);
end component;

signal Habilitar 	: std_logic;
signal Dato_in		: std_logic_vector(3 downto 0);
signal Dato_out	: std_logic_vector(3 downto 0);

	
begin

	UC: unidad_control port map
		(
			clk_i					=> 		   clk_i, 
			reset_i		 		=>  	    reset_i, 
			data_rom_i			=>       data_rom, -- Dato de salida de la ROM
			data_ram_i			=>    data_ram_out,
			entradaALU_i		=>    		 Dato,
			clk_o 				=>            clk,
			WR_o 					=>             WR,
			habilitar_i			=>      Habilitar,
			ope_ALU_o			=>        ope_ALU, 
			salidaALU_o			=>      salidaALU, 		
			W_o					=>        Dato_in, 
			RAM_o					=>        data_ram_in,
			add_ram_o         =>        add_ram, 
			add_rom_o         =>        add_rom 
		);
		
		
	ROM: MEM_ROM 
		 generic map
		 (
			  DATA_WIDTH => 8,
			  ADD_WIDTH  => 2
		 )
		 Port map
		 ( 
				 ADD_i 	=> add_rom,
				DATA_o 	=> data_rom,
				 clk_i 	=> clk
		);
		
		
	RAM:MEM_RAM 
 		 generic map
		 (
				DATA_WIDTH => 4,
				ADD_WIDTH  => 2
		 )
		 Port map
		 ( 
				 ADD_i 	=> add_ram,
				DATA_i 	=> data_ram_in,
				DATA_o 	=> data_ram_out,
				  WR_i 	=> WR,
				 clk_i 	=> clk
			);

			
	ALU_MOD: ALU port map 
	(
		operacaion_i	=> ope_ALU,
		Dato_RL_i		=> salidaALU,
		Dato_W_i			=> Dato_out,
		Dato_o			=> Dato
		
);

	W: W_REG port map 
	(
		clk_i 			=> clk,
		Habilitar_i 	=> Habilitar,
		Dato_in_i		=> Dato_in,
		Dato_out_o		=> Dato_out		
	);
	
end rtl;
