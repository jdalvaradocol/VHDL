-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity contador5 is
	port 
	(
		clk_i	     : in std_logic;
		R_o	     : out std_logic;
		contador_o : out std_logic_vector(3 downto 0)
	);
end contador5;

architecture Behavioral of contador5 is

component FFT is
	port 
	(
		T_i, R_i, clk_i  :  in std_logic;
		Q_o			     : out std_logic
	);
end component;

signal reset : std_logic:='0';
signal contador : std_logic_vector(3 downto 0):="0000";
 
begin
	
	FFTD: FFT port map
	(
		T_i	=> '1', 
		R_i	=> reset, 
		clk_i	=>	clk_i,
		Q_o   => contador(0)
	);

	FFTC: FFT port map
	(
		T_i	=> '1', 
		R_i	=> reset, 
		clk_i	=>	contador(0),
		Q_o   => contador(1)
	);

	FFTB: FFT port map
	(
		T_i	=> '1', 
		R_i	=> reset, 
		clk_i	=>	contador(1),
		Q_o   => contador(2)
	);
	
	FFTA: FFT port map
	(
		T_i	=> '1', 
		R_i	=> reset, 
		clk_i	=>	contador(2),
		Q_o   => contador(3)
	);
	
reset <= '1' when contador = "0110" else '0';		

contador_o <= contador;
R_o <= reset;
	
end Behavioral;
