-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i 		:  in std_logic;
		reset_i 		:  in std_logic;
		data_ram_o 	: out std_logic_vector(3 downto 0);
		data_rom_o 	: out std_logic_vector(7 downto 0);
		alu_o      	: out std_logic_vector(3 downto 0);
		wreg_o     	: out std_logic_vector(3 downto 0)
	);
end principal;

architecture Behavioral of principal is

signal	data_rom 	: std_logic_vector(7 downto 0):= "00000000";						
signal	add_rom   	: std_logic_vector(3 downto 0):= "0000";	

signal	data_ram_ui : std_logic_vector(3 downto 0):= "0000";
signal	data_ram_uo	: std_logic_vector(3 downto 0):= "0000";
signal	add_ram		: std_logic_vector(3 downto 0):= "0000";
signal	wr_ram		: std_logic := '0'; 	

signal	data_ALU		: std_logic_vector(3 downto 0):= "0000";	
signal	alu_A			: std_logic_vector(3 downto 0):= "0000";
signal	alu_B	   	: std_logic_vector(3 downto 0):= "0000";
signal	sel_ope		: std_logic_vector(1 downto 0):= "00";

signal	data_wreg_ui : std_logic_vector(3 downto 0):= "0000"; 
signal	data_wreg_uo : std_logic_vector(3 downto 0):= "0000";     
signal	wr_wreg		 : std_logic := '0';	   									



begin

	unidad : entity work.unidad_control port map
	(
		reset_i		=> reset_i, 
		clk_i 		=>   clk_i,					
		data_rom_i 	=> data_rom,						
		data_ALU_i	=> data_ALU, 	
		data_wreg_i	=> data_wreg_ui, 
		data_ram_i 	=> data_ram_ui,
		data_ram_o	=> data_ram_uo, 
		data_wreg_o => data_wreg_uo,    
		add_ram_o	=> add_ram, 
		add_rom_o 	=> add_rom,	
		wr_ram_o		=> wr_ram, 	
		wr_wreg_o   => wr_wreg,									
		alu_A_o		=> alu_A, 
		alu_B_o     => alu_B,
		sel_ope_o	=>	sel_ope					 			
	);  

	ROM: entity work.MEM_ROM generic map
	(
		DATA_WIDTH 	=> 8,
      ADD_WIDTH 	=> 4
	)
	port map
	(
		add_i  => add_rom,
      data_o => data_rom, 
      clk_i  => clk_i
	);	

	RAM: entity work.MEM_RAM generic map
	(
		DATA_WIDTH 	=> 4,
      ADD_WIDTH 	=> 4
	)
	port map
	(
		add_i  => add_ram,
		data_i => data_ram_uo,
      data_o => data_ram_ui,
		wr_i 	 => wr_ram,
      clk_i  => clk_i
	);		
	
	WREG : entity work.W_REG 	port map
	(
		clk_i 		=>   clk_i,
		wr_i 			=> wr_wreg,
		Dato_in_i	=> data_wreg_uo,
		Dato_out_o	=> data_wreg_ui		
	);
	
	unidad_ALU : entity work.ALU 	port map
	(
		operacaion_i => sel_ope, 
		alu_A_i		 => alu_A,
		alu_B_i		 => alu_B,
		dato_o		 => data_ALU				
	);

data_ram_o 	<= data_ram_ui;
data_rom_o 	<= data_rom;
alu_o      	<= data_ALU;
wreg_o     	<= data_wreg_ui;
	
end Behavioral;







