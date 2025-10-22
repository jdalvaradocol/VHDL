-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity baud_clk is
	generic  
	(
		FREC_CLK   : integer := 50e6;
		BAUD_RATE  : integer := 9600;
		OVERSAMPLE : integer := 16		
	);
	port
	(
		clk_i	  			: in std_logic;
		reset_i 			: in std_logic;
		clk_baud_o		: out std_logic;
		clk_overbaud_o : out std_logic
	);
end baud_clk;

architecture Behavioral of baud_clk is

-- DIVISOR_SAMPLE = 50e6 / (9600*16) = 326;
constant DIVISOR_SAMPLE : integer := FREC_CLK / (BAUD_RATE * OVERSAMPLE);
-- PULSO = DIVISOR_SAMPLE / 8 = 326 / 8 = 4;
constant PULSO : integer := DIVISOR_SAMPLE / 8;
-- counter en el rango de 0 a 325
signal counter : integer range 0 to DIVISOR_SAMPLE-1 := 0;
-- counter en el rango de 0 a 15
signal counter_sample : integer range 0 to OVERSAMPLE-1 := 0;

begin

	process(clk_i, reset_i)
	begin
    
	 if reset_i = '0' then
	
		counter     <= 0;
		counter_sample  <= 0;
		clk_overbaud_o <= '0';
		clk_baud_o   <= '0';
    
	 elsif rising_edge(clk_i) then
      
      if counter = DIVISOR_SAMPLE-1 then
        
        counter <= 0;
        
        if counter_sample = OVERSAMPLE-1 then
            counter_sample <= 0;
        else        
            counter_sample <= counter_sample + 1;
        end if;
        
      else
        counter <= counter + 1;
      end if;
      
      if counter < PULSO then
        clk_overbaud_o <= '1';          
      else
        clk_overbaud_o <= '0';
      end if;
      
      if counter_sample = OVERSAMPLE-1 then
        clk_baud_o <= '1';
      else
        clk_baud_o <= '0';
      end if;
          
    end if;
  end process;
	
end Behavioral;



