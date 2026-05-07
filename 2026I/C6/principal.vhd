-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		    clk_i : in  std_logic;
		      C_i : in  std_logic;	
		entrada_i : in  std_logic_vector(3 downto 0);
		salidaL_o : out std_logic_vector(3 downto 0);
	  salidaFF_o : out std_logic_vector(3 downto 0)	
	 );
end principal;

architecture Behavioral of principal is

component LD is
	port 
	(
		D_i, C_i : in  std_logic;
		Q_o		: out std_logic
	);
end component;

component FFD is
	port 
	(
		D_i, C_i : in  std_logic;
		Q_o		: out std_logic
	);
end component;

component CLC is
	port 
	(
		entrada_i : in  std_logic_vector(3 downto 0);
		 salida_o : out std_logic_vector(3 downto 0)
	);
end component;

signal salida : std_logic_vector(3 downto 0):="0000";

begin
	
	CLC_PRIN: CLC port map 
	(
		entrada_i => entrada_i,
		salida_o  => salida
	);

	LD3: LD port map
	(
		D_i =>    salida(3), 
		C_i =>          C_i, 
		Q_o => salidaL_o(3)
	); 	

	LD2: LD port map
	(
		D_i =>    salida(2), 
		C_i =>          C_i, 
		Q_o => salidaL_o(2)
	); 	
	
	LD1: LD port map
	(
		D_i =>    salida(1), 
		C_i =>          C_i, 
		Q_o => salidaL_o(1)
	); 	
	
	LD0: LD port map
	(
		D_i =>    salida(0), 
		C_i =>          C_i, 
		Q_o => salidaL_o(0)
	); 	
	
	FFD3: FFD port map
	(
		D_i =>     salida(3), 
		C_i =>         clk_i, 
		Q_o => salidaFF_o(3)
	); 

	FFD2: FFD port map
	(
		D_i =>     salida(2), 
		C_i =>         clk_i, 
		Q_o => salidaFF_o(2)
	); 	

	FFD1: FFD port map
	(
		D_i =>     salida(1), 
		C_i =>         clk_i, 
		Q_o => salidaFF_o(1)
	); 	
	
	FFD0: FFD port map
	(
		D_i =>     salida(0), 
		C_i =>         clk_i, 
		Q_o => salidaFF_o(0)
	); 	
	
end Behavioral;






