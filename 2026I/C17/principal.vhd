-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_Std.all; 

entity principal is
	port 
	(
		   clk_i :  in std_logic;
		enable_i :  in std_logic;
	      add_o	: out std_logic_vector(3 downto 0);
	 data_rom_o	: out std_logic_vector(7 downto 0);
    data_ram_o	: out std_logic_vector(7 downto 0)
	);
end principal;


architecture Behavioral of principal is

component ROM is
	port 
	(
		   clk_i :  in std_logic;
		enable_i :  in std_logic;
		   add_i	:  in std_logic_vector(3 downto 0);
		  data_o	: out std_logic_vector(7 downto 0)
	);
end component;

component RAM is
	port 
	(
		   clk_i :  in std_logic;
		enable_i :  in std_logic;
		 add_i	:  in std_logic_vector(1 downto 0);
	 	    WR_i :  in std_logic;
		  data_i	:  in std_logic_vector(7 downto 0);
		  data_o	: out std_logic_vector(7 downto 0)
	);
end component;

component MEF is
	port 
	(	
		              clk_i 	:  in std_logic;
		         pos_dato_o 	: out std_logic_vector(1 downto 0);
		activar_operacion_o	: out std_logic;
		          add_rom_o  : out std_logic_vector(3 downto 0);
					 add_ram_o  : out std_logic_vector(1 downto 0);
					      WR_o  : out std_logic
	);
end component;

signal add_rom	: std_logic_vector(3 downto 0):= "0000";
signal add_ram	: std_logic_vector(1 downto 0):= "00";

signal data_rom : std_logic_vector(7 downto 0):= "00000000";
signal data_ram : std_logic_vector(7 downto 0):= "00000000";

signal operadorA : integer range 0 to 255:=0;
signal operadorB : integer range 0 to 255:=0;
signal operacion : integer range 0 to 255:=0;


signal pos_dato 			 : std_logic_vector(1 downto 0):= "00";
signal activar_operacion : std_logic := '0';
signal WR 					 : std_logic := '0';

begin

	MROM: ROM port map
	(
		   clk_i => clk_i,   
		enable_i => enable_i,
		   add_i	=> add_rom,
		  data_o => data_rom
	);

	MRAM: RAM port map
	(
		   clk_i => clk_i,   
		enable_i => enable_i,
			 WR_i => WR,
		   add_i	=> add_ram,
		  data_i => data_ram,
		  data_o => data_ram_o
	);
	
	MEF_CONTROL: MEF port map  
	(	
		              clk_i 	=> clk_i, 
		         pos_dato_o 	=> pos_dato, 
		activar_operacion_o	=> activar_operacion, 
		          add_rom_o  => add_rom, 
					 add_ram_o  => add_ram, 
					      WR_o  => WR 
	);

process(clk_i)
    begin
        if rising_edge(clk_i) then
            if enable_i = '1' then
                
                if pos_dato = "00" then
                    operadorA <= to_integer(unsigned(data_rom));
                elsif pos_dato = "01" then
                    operadorB <= to_integer(unsigned(data_rom));
                end if;
                
                if activar_operacion = '1' then
                    operacion <= operadorA + operadorB;
                end if;
                
            end if;
        end if;
		  
    end process;	
	
	data_ram <= std_logic_vector(to_unsigned(operacion, data_ram'length)); 
	data_rom_o <= data_rom;
	add_o <= add_rom;
	
end Behavioral;






