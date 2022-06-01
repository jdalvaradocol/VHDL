-- Quartus II VHDL Template
-- Four-State Mealy State Machine

-- A Mealy machine has outputs that depend on both the state and
-- the inputs.	When the inputs change, the outputs are updated
-- immediately, without waiting for a clock edge.  The outputs
-- can be written more than once per state or per clock cycle.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uni_control is

	port
	(
		clk_i		 	: in	std_logic;
		reset_i		 	: in	std_logic;
		add_rom_o	: out	std_logic_vector(1 downto 0);
		add_ram_o	: out	std_logic_vector(1 downto 0);
			  WR_o 	: out	std_logic
	);

end entity;

architecture rtl of uni_control is

signal estado  : integer range 0 to 6 := 0;
signal add_rom : integer range 0 to 3 := 0;
signal add_ram : integer range 0 to 3 := 0;

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
	
	process (clk_i, reset_i)
	begin

		if reset_i = '1' then
			
			add_rom_o <= "00";
			add_ram_o <= "00";
				  WR_o <= '0';	
			   estado <= 0;
				add_rom <= 0;
				add_ram <= 0;

		elsif (rising_edge(clk_i)) then
		
			-- Se define el comportamiento del estado S0
			
			if estado = 0 then 
			
				add_rom_o <=  std_logic_vector(to_unsigned(add_rom,add_rom_o'length));
				estado <= estado + 1;
			
			-- Se define el comportamiento del estado S1	
	
			elsif estado = 1  then 	

				estado <= estado + 1;

			-- Se define el comportamiento del estado S2	
				
			elsif estado = 2  then 	

				 add_ram_o <=  std_logic_vector(to_unsigned(add_ram,add_ram_o'length));
				 WR_o <= '1';	
				 estado <= estado + 1;	
			
			-- Se define el comportamiento del estado S3	
			
			elsif estado = 3  then 	

				 estado <= estado + 1;
			
			-- Se define el comportamiento del estado S4	
			
			elsif estado = 4  then 	

				 add_ram_o <=  std_logic_vector(to_unsigned(add_ram,add_ram_o'length));
				 WR_o <= '0';	
				 estado <= estado + 1;	
			
			-- Se define el comportamiento del estado S5	
			
			elsif estado = 5  then 	

				 estado <= estado + 1;	
				
			-- Se define el comportamiento del estado S6	
			
			elsif estado = 6  then 	

					estado <= 0;
					
					if add_rom < 3 then 
					
						add_rom <= add_rom + 1;
						add_ram <= add_ram + 1;
						
					else
						
						add_rom <= 0;
						add_ram <= 0;
					
					end if;
				
			end if;
			
		end if;	
			
	end process;
	
end rtl;