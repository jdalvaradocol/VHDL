-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity MEF is
	port 
	(
		clk_i :  in std_logic;
		  x_i :  in std_logic_vector(1 downto 0);
		  m_o : out std_logic_vector(1 downto 0);
		  y_o : out std_logic_vector(3 downto 0)
	);
end MEF;

architecture Behavioral of MEF is

-- ESTADO1, ESTADO2, ESTADO3, ESTADO4
--  "0001",  "0010",  "0100",  "1000"

-- x_i = 00 -->
-- x_i = 01 ---
-- x_i = 10 <--
-- x_i = 11 ---

type estado_type is (ESTADO1, ESTADO2, ESTADO3, ESTADO4);
signal estado : estado_type := ESTADO1;

begin

	process(clk_i, x_i)

	begin
	
		if rising_edge(clk_i) then
			
			if estado = ESTADO1 then
			
				m_o <= "00";
							
				if x_i = "00" then
					estado <= ESTADO2;
					y_o <= x"2";
				elsif x_i = "10" then
					estado <= ESTADO4;
					y_o <= x"8";
				elsif (x_i = "01") or (x_i = "11") then
					estado <= ESTADO1;
					y_o <= x"1";
				end if;
		
			elsif estado = ESTADO2 then
			
				m_o <= "01";
			
				if x_i = "00" then
					estado <= ESTADO3;
					y_o <= "0100";
				elsif x_i = "10" then
					estado <= ESTADO1;
					y_o <= "0001";
				elsif (x_i = "01") or (x_i = "11") then
					estado <= ESTADO2;
					y_o <= "0010";
				end if;

		elsif estado = ESTADO3 then
			
				m_o <= "10";
			
				if x_i = "00" then
					estado <= ESTADO4;
					y_o <= "1000";
				elsif x_i = "10" then
					estado <= ESTADO2;
					y_o <= "0010";
				elsif (x_i = "01") or (x_i = "11") then
					estado <= ESTADO3;
					y_o <= "0100";
				end if;

		elsif estado = ESTADO4 then
			
				m_o <= "11";
			
				if x_i = "00" then
					estado <= ESTADO1;
					y_o <= "0001";
				elsif x_i = "10" then
					estado <= ESTADO3;
					y_o <= "0100";
				elsif (x_i = "01") or (x_i = "11") then
					estado <= ESTADO4;
					y_o <= "1000";
				end if;
				
			end if;
		
		end if;
	
	end process;
	
end Behavioral;




