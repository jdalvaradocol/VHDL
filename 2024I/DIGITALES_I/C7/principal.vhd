-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity principal is
	port 
	(
		A_i, B_i 	:  in std_logic_vector(3 downto 0);
		NP_o      	: out std_logic;		
		S_o      	: out std_logic_vector(3 downto 0)		
	);
end principal;

architecture Behavioral of principal is

component completo_sumador is
	port 
	(
		A_i, B_i, C_i 	: in std_logic;
		C_o, S_o 		: out std_logic
	);
end component;

signal entrada_A 				: std_logic_vector(3 downto 0) := "0000";		
signal entrada_B 				: std_logic_vector(3 downto 0) := "0000";		

signal Carry_A 				: std_logic_vector(2 downto 0) := "000";		
signal Carry_B 				: std_logic_vector(2 downto 0) := "000";		

signal acarreo_circular_A : std_logic := '0';	
signal acarreo_circular_B : std_logic := '0';		
	
signal resultado_A 		: std_logic_vector(3 downto 0) := "0000";		
signal resultado_B 		: std_logic_vector(3 downto 0) := "0000";		

begin

	entrada_A <= not (B_i);

	SA0: completo_sumador port map 
	(
		A_i => A_i(0), 
		B_i => entrada_A(0),
		C_i => '1',
		C_o => Carry_A(0), 
		S_o => resultado_A(0)
	);

	SA1: completo_sumador port map 
	(
		A_i => A_i(1), 
		B_i => entrada_A(1),
		C_i => Carry_A(0),
		C_o => Carry_A(1), 
		S_o => resultado_A(1)
	);
	
	SA2: completo_sumador port map 
	(
		A_i => A_i(2), 
		B_i => entrada_A(2),
		C_i => Carry_A(1),
		C_o => Carry_A(2), 
		S_o => resultado_A(2)
	);

	SA3: completo_sumador port map 
	(
		A_i => A_i(3), 
		B_i => entrada_A(3),
		C_i => Carry_A(2),
		C_o => acarreo_circular_A, 
		S_o => resultado_A(3)
	);

	entrada_B <= not (resultado_A);
	
	
	SB0: completo_sumador port map 
	(
		A_i => '0', 
		B_i => entrada_B(0),
		C_i => '1',
		C_o => Carry_B(0), 
		S_o => resultado_B(0)
	);

	SB1: completo_sumador port map 
	(
		A_i => '0', 
		B_i => entrada_B(1),
		C_i => Carry_B(0),
		C_o => Carry_B(1), 
		S_o => resultado_B(1)
	);
	
	SB2: completo_sumador port map 
	(
		A_i => '0', 
		B_i => entrada_B(2),
		C_i => Carry_B(1),
		C_o => Carry_B(2), 
		S_o => resultado_B(2)
	);

	SB3: completo_sumador port map 
	(
		A_i => '0', 
		B_i => entrada_B(3),
		C_i => Carry_B(2),
		C_o => acarreo_circular_B, 
		S_o => resultado_B(3)
	);
	
	S_o <= 	resultado_A when acarreo_circular_A = '1' else
				resultado_B when acarreo_circular_A = '0' else
				"0000";
				
	NP_o <= acarreo_circular_A;			
	
end Behavioral;









