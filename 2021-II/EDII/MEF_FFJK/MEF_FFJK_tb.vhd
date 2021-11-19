library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEF_FFJK_tb is
		--Port ();
end MEF_FFJK_tb;

architecture rtl of MEF_FFJK_tb is

signal clk 	: std_logic := '0';
signal X 	: std_logic := '0';

signal S : std_logic_vector(1 downto 0) := "00";
signal Y : std_logic := '0';

begin

clk <= not clk after 1 ns;

-- X <= not X after 5 ns;

X   <= '0'    after 0 ns,
		 '1'    after 10 ns,
		 '0'    after 15 ns,
		 '1'    after 20 ns ;
	
MEF_FFD_sim : entity work.MEF_FFJK port map
		(
			X_i	=> X		, 	
         clk_i	=> clk	,	 
         A_o	=> S(1)  ,
			B_o	=> S(0)		
		);

end rtl;