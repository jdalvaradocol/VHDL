-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal_tb is
	-- port (	);
end principal_tb;

architecture Behavioral of principal_tb is

signal	entrada_tb : std_logic_vector(3 downto 0) := "0000"; 
signal	S_tb 		  : std_logic_vector(1 downto 0) := "00";
signal	XA_tb 	  : std_logic := '0';
signal	XB_tb		  : std_logic := '0';
signal	XC_tb		  : std_logic := '0';
signal	XD_tb		  : std_logic := '0';

begin

	entrada_tb <= "1010" ;
	
	S_tb       <= 	"00" after 0ns, 
						"01" after 5ns,	
						"10" after 10ns,
						"11" after 15ns;
	
	Mux_tb: entity work.principal port map
	(
		entrada_i => entrada_tb,
		S_i 		 =>       S_tb,	
	   XA_o 		 =>      XA_tb,
		XB_o 		 =>		XB_tb,
		XC_o 		 =>    	XC_tb,
		XD_o 		 =>		XD_tb		
	);

end Behavioral;







