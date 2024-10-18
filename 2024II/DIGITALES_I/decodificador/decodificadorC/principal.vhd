-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
			entrada_i 	: in  std_logic_vector(3 downto 0);
			salida_o		: out	std_logic_vector(6 downto 0) 
	);
end principal;

architecture Behavioral of principal is

component mux16x1 is
	port 
	(
			selector_i 	: in  std_logic_vector(3 downto 0);
			entrada_i	: in  std_logic_vector(15 downto 0);
			salida_o		: out	std_logic 
	);
end component;


begin

	muxG: mux16x1 port map 
	(
		selector_i	=> entrada_i,
		entrada_i   => "1100000100001000",
		salida_o		=> salida_o(6) 
	);

	muxF: mux16x1 port map 
	(
		selector_i	=> entrada_i,
		entrada_i   => "0111000100000100",
		salida_o		=> salida_o(5) 
	);

	muxE: mux16x1 port map 
	(
		selector_i	=> entrada_i,
		entrada_i   => "0101110101000000",
		salida_o		=> salida_o(4) 
	);	

	muxD: mux16x1 port map 
	(
		selector_i	=> entrada_i,
		entrada_i   => "0100100101100001",
		salida_o		=> salida_o(3) 
	);	

	muxC: mux16x1 port map 
	(
		selector_i	=> entrada_i,
		entrada_i   => "0010000000001011",
		salida_o		=> salida_o(2) 
	);	

	muxB: mux16x1 port map 
	(
		selector_i	=> entrada_i,
		entrada_i   => "0000011000011011",
		salida_o		=> salida_o(1) 
	);	
	
	muxA: mux16x1 port map 
	(
		selector_i	=> entrada_i,
		entrada_i   => "0100101000010100",
		salida_o		=> salida_o(0) 
	);	

end Behavioral;











