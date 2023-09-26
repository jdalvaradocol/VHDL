library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		S_i 		 :	in std_logic_vector(1 downto 0);	
	   XA_o 		 : out std_logic;
		XB_o 		 : out std_logic;
		XC_o 		 : out std_logic;
		XD_o 		 : out std_logic
	);
end principal;

architecture Behavioral of principal is

component mux4x1_hdl1 is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		S_i :	in std_logic_vector(1 downto 0);	
	   X_o : out std_logic
	);
end component;

component mux4x1_hdl2 is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		S_i :	in std_logic_vector(1 downto 0);	
	   X_o : out std_logic
	);
end component;

component mux4x1 is
	port 
	(
		entrada_i : in std_logic_vector(3 downto 0);
		S_i :	in std_logic_vector(1 downto 0);	
	   X_o : out std_logic
	);
end component;

component mux4x1_logic is
	port 
	(
		A_i, B_i, C_i, D_i, S0_i, S1_i : in std_logic;
		                           X_o : out std_logic
	);
end component;

begin
	
	MUX1 : mux4x1_hdl1 port map
	(
		entrada_i => entrada_i,
		S_i       =>       S_i,	
		X_o       =>      XA_o
	);

	MUX2: mux4x1_logic port map 
	(
		A_i 	=> entrada_i(3), 
		B_i 	=> entrada_i(2), 
		C_i	=> entrada_i(1), 
		D_i 	=> entrada_i(0), 
		S0_i  => S_i(0),
		S1_i  => S_i(1),
		 X_o  => XB_o
	);
	
	MUX3 : mux4x1_hdl2 port map
	(
		entrada_i => entrada_i,
		S_i       =>       S_i,	
		X_o       =>      XC_o
	);	

	MUX4 : mux4x1 port map
	(
		entrada_i => entrada_i,
		S_i       =>       S_i,	
		X_o       =>      XD_o
	);		

end Behavioral;