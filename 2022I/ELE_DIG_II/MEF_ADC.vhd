-- Quartus II VHDL Template
-- Four-State Mealy State Machine

-- A Mealy machine has outputs that depend on both the state and
-- the inputs.	When the inputs change, the outputs are updated
-- immediately, without waiting for a clock edge.  The outputs
-- can be written more than once per state or per clock cycle.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEF_ADC is

	port
	(
		clk_i		 	: in	std_logic;
		EN_i		 	: in	std_logic;
		reset_i	 	: in	std_logic;
		SEL_CH_o	 	: out	std_logic_vector(2 downto 0)
	);

end entity;

architecture rtl of MEF_ADC is

signal SEL_CH : std_logic_vector(2 downto 0) := "000";
signal estado : integer range 0 to 3 := 0;
signal div_fre : integer range 0 to 10000000 := 0;

signal clk_div : std_logic := '0';


begin

	div : process (clk_i)
	
	begin
	
		if (rising_edge(clk_i)) then
				
				div_fre <= div_fre + 1;
				
				if div_fre = 10000000 then
				
					clk_div <= not clk_div;

				end if;
						
		end if;

	end process div;
	
	process (clk_div, reset_i)
	begin

		if reset_i = '0' then
			
			SEL_CH <= "000";
			estado <= 0;

		elsif (rising_edge(clk_div)) then
		
			-- Se define el comportamiento del estado S0
			
			if (estado = 0) and (EN_i = '0')  then 
			
				SEL_CH <= "001";
				estado <= estado;
				
			elsif estado = 0 and EN_i = '1'  then 	

				SEL_CH <= "001";
				estado <= estado + 1;
				
			-- Se define el comportamiento del estado S1	
			
			elsif estado = 1 and EN_i = '0'  then 
			
				SEL_CH <= "011";
				estado <= estado;
				
			elsif estado = 1 and EN_i = '1'  then 	

				SEL_CH <= "011";
				estado <= estado + 1;	
			
			-- Se define el comportamiento del estado S2	
			
			elsif estado = 2 and EN_i = '0'  then 
			
				SEL_CH <= "010";
				estado <= estado;
				
			elsif estado = 2 and EN_i = '1'  then 	

				SEL_CH <= "010";
				estado <= estado + 1;
			
			-- Se define el comportamiento del estado S3	
			
			elsif estado = 3 and EN_i = '0'  then 
			
				SEL_CH <= "000";
				estado <= estado;
				
			elsif estado = 3 and EN_i = '1'  then 	

				SEL_CH <= "000";
				estado <= 0;	
			
			end if;
			
		end if;	
			
	end process;

	SEL_CH_o <= SEL_CH;
	
end rtl;
