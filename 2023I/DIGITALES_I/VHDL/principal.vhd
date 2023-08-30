-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		  SW_i :   in std_logic_vector(3 downto 0); 
		LEDSA_o : out std_logic_vector(1 downto 0);
		LEDSB_o : out std_logic_vector(1 downto 0);
		LEDSC_o : out std_logic_vector(1 downto 0)

	);
end principal;

architecture Behavioral of principal is

component compuertas is
	port 
	(
		  SW_i :  in std_logic_vector(3 downto 0); 
		LEDS_o : out std_logic_vector(1 downto 0)

	);
end component;

component circuito_vhdl_A is
	port 
	(
		  SW_i :  in std_logic_vector(3 downto 0); 
		LEDS_o : out std_logic_vector(1 downto 0)

	);
end component;

component circuito_vhdl_B is
	port 
	(
		  SW_i :  in std_logic_vector(3 downto 0); 
		LEDS_o : out std_logic_vector(1 downto 0)

	);
end component;

begin

	
	OPC_A: compuertas port map
	(
		SW_i => SW_i,
		LEDS_o => LEDSA_o
	);

	OPC_B: circuito_vhdl_A port map
	(
		SW_i => SW_i,
		LEDS_o => LEDSB_o
	);

	OPC_C: circuito_vhdl_B port map
	(
		SW_i => SW_i,
		LEDS_o => LEDSC_o
	);	
	

end Behavioral;





