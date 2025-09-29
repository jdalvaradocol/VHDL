-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		clk_i	  			: in std_logic;
		reset_i 			: in std_logic;
		clk_baud_o		: out std_logic;
		clk_overbaud_o : out std_logic;
		data_i	      : in  std_logic_vector(7 downto 0);
		data_o	      : out std_logic_vector(7 downto 0);
		rx_i	  	      : in  std_logic;
		tx_i	  	      : in  std_logic;
		tx_o	  	      : out std_logic
	);
end principal;

architecture Behavioral of principal is

constant OVERSAMPLE : integer := 10;

signal     clk_baud : std_logic:= '0';
signal clk_overbaud : std_logic:= '0';

begin

	clk_baud_model: entity work.baud_clk
	generic map  
	(
		FREC_CLK   => 50e6,
		BAUD_RATE  => 9600,
		OVERSAMPLE => OVERSAMPLE		
	)
	port map
	(
		clk_i	  			=> 	    clk_i,
		reset_i 			=> 	  reset_i,
		clk_baud_o		=>     clk_baud,
		clk_overbaud_o => clk_overbaud
	);
	
	uart_tx_model: entity work.uart_tx 
		port map
		(
			clk_baud_i => clk_baud,
			reset_i    =>  reset_i,
 			data_i	  =>   data_i, 
			tx_i	  	  =>     tx_i,
			tx_o	  	  =>     tx_o
		);

		uart_rx_model: entity work.uart_rx 
		generic map   
		(
			OVERSAMPLE => OVERSAMPLE		
		)
		port map 
		(
			clk_overbaud_i => clk_overbaud,
			reset_i    		=> reset_i,
			rx_i	  	  		=> rx_i,
			data_o	  		=> data_o
		);
		
clk_baud_o     <= clk_baud;		
clk_overbaud_o <= clk_overbaud;
	
end Behavioral;



