-- Quartus II VHDL Template
-- Four-State Mealy State Machine

-- A Mealy machine has outputs that depend on both the state and
-- the inputs.	When the inputs change, the outputs are updated
-- immediately, without waiting for a clock edge.  The outputs
-- can be written more than once per state or per clock cycle.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RTL_REG is

	port
	(
		clk_i		 	: in	std_logic;
		reset_i		: in	std_logic;
		data_ram_o	: out	std_logic_vector(7 downto 0)
	);

end entity;

architecture rtl of RTL_REG is

component uni_control is

	port
	(
		clk_i		 	: in	std_logic;
		reset_i		: in	std_logic;
		add_rom_o	: out	std_logic_vector(1 downto 0);
		add_ram_o	: out	std_logic_vector(1 downto 0);
			  WR_o 	: out	std_logic
	);

end component;

component MEM_ROM is

    generic
    (
			DATA_WIDTH :  natural  := 0;
			ADD_WIDTH :   natural  := 0
    );

    Port ( 
				ADD_i : in STD_LOGIC_VECTOR ((ADD_WIDTH - 1) downto 0);
				DATA_o : out STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
				clk_i : in STD_LOGIC
			  );
end component;

component ope_inv is

	port
	(
		data_rom_i	: in	std_logic_vector(7 downto 0);
		data_ram_o	: out	std_logic_vector(7 downto 0)
	);

end component;

component MEM_RAM is

    generic
    (
        DATA_WIDTH :  natural  := 8;
        ADD_WIDTH :   natural  := 5
    );
    Port ( 
				ADD_i 	: in 	STD_LOGIC_VECTOR ((ADD_WIDTH - 1) downto 0);
				DATA_i : in 	STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
				DATA_o : out STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
				WR_i 	: in 	STD_LOGIC;
				clk_i 	: in 	STD_LOGIC
			  );
end component;


-- Señales unidad de control
signal	add_rom	: 	std_logic_vector(1 downto 0);
signal	add_ram	: 	std_logic_vector(1 downto 0);
signal	     WR 	: 	std_logic;

-- Señales Memoria ROM
signal	data_rom	: 	std_logic_vector(7 downto 0);

-- Señales Memoria RAM
signal	data_ram	: 	std_logic_vector(7 downto 0);

begin

	UC: uni_control port map
			(
				clk_i		 	=>  clk_i	,
				reset_i		=>  reset_i	,
				add_rom_o	=>  add_rom	,
				add_ram_o	=>  add_ram ,
				WR_o 			=>  WR
			);

	ROM: MEM_ROM generic map
		(
			DATA_WIDTH => 8,
			ADD_WIDTH  => 2
		)
	 port map
		( 
			ADD_i 	=>  add_rom	 ,
			DATA_o 	=>  data_rom ,
			clk_i 	=>  clk_i
		);

	OPE: ope_inv port map
			(
				data_rom_i	=>  data_rom ,
				data_ram_o	=>  data_ram
			);
			
	
	RAM: MEM_RAM generic map
		(
			DATA_WIDTH => 8,
			ADD_WIDTH  => 2
		)
	 port map
		( 
			ADD_i 	=>  add_ram	 ,
			DATA_i	=>  data_ram ,
			DATA_o 	=>  data_ram_o,
			WR_i 		=>  WR,
			clk_i 	=>  clk_i			
		);
	
end rtl;