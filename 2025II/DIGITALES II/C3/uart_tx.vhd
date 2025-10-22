-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity uart_tx is
	port 
	(
		clk_baud_i : in  std_logic;
		reset_i    : in  std_logic;
		data_i	  : in  std_logic_vector(7 downto 0);
		tx_i	  	  : in  std_logic;
		tx_o	  	  : out std_logic
	);
end uart_tx;


architecture Behavioral of uart_tx is

type mef_t is (INICIO, D0, D1, D2, D3, D4, D5, D6, D7, PARADA, IDLE);
signal estado : mef_t := IDLE;

begin

	process(clk_baud_i, data_i, tx_i, reset_i)
	
	begin
	
		if reset_i = '0' then
		
			tx_o <= '1';
			estado <= IDLE;
			
		elsif rising_edge(clk_baud_i) then

			if tx_i = '0' then
				if estado = IDLE then
					estado <= INICIO;
					tx_o <= '1';
				end if;
			end if;	
				
			if estado = INICIO then
					tx_o <= '0';
					estado <= D0;
			elsif estado = D0 then
					tx_o <= data_i(0);
					estado <= D1;
			elsif estado = D1 then
					tx_o <= data_i(1);
					estado <= D2;
			elsif estado = D2 then
					tx_o <= data_i(2);
					estado <= D3;		
			elsif estado = D3 then
					tx_o <= data_i(3);
					estado <= D4;
			elsif estado = D4 then
					tx_o <= data_i(4);
					estado <= D5;
			elsif estado = D5 then
					tx_o <= data_i(5);
					estado <= D6;	
			elsif estado = D6 then
					tx_o <= data_i(6);
					estado <= D7;
			elsif estado = D7 then
					tx_o <= data_i(7);
					estado <= PARADA;
			elsif estado = PARADA then
					tx_o <= '1';
					estado <= IDLE;				
			end if;
				
		end if;
	
	end process;
	
end Behavioral;



