-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity sumador is
	port 
	(
		Ax_i	   : in std_logic_vector(3 downto 0);
		Bx_i	   : in std_logic_vector(3 downto 0);
		Sx_o	   : out std_logic_vector(4 downto 0)
	);

end entity;

architecture rtl of sumador is

component semisumador is
	port 
	(
		A_i	   : in std_logic;
		B_i	   : in std_logic;
		Ac_o	   : out std_logic;
		S_o	   : out std_logic
	);
end component;

component sumadorcompleto is
	port 
	(
		A_i	   : in std_logic;
		B_i	   : in std_logic;
		Ac_i	   : in std_logic;
		Ac_o	   : out std_logic;
		S_o	   : out std_logic
	);
end component;

signal Carry: std_logic_vector(2 downto 0);

begin

SumaB0: semisumador port map
			(	
				A_i	=>  Ax_i(0), 
				B_i	=>  Bx_i(0),  
				Ac_o	=>  Carry(0),
				S_o	=>  Sx_o(0)
			);

SumaB1: sumadorcompleto port map
			(	
				A_i	=>  Ax_i(1), 
				B_i	=>  Bx_i(1), 
				Ac_i  =>  Carry(0),
				Ac_o	=>  Carry(1),
				S_o	=>  Sx_o(1)
			);	

SumaB2: sumadorcompleto port map
			(	
				A_i	=>  Ax_i(2), 
				B_i	=>  Bx_i(2), 
				Ac_i  =>  Carry(1),
				Ac_o	=>  Carry(2),
				S_o	=>  Sx_o(2)
			);		

SumaB3: sumadorcompleto port map
			(	
				A_i	=>  Ax_i(3), 
				B_i	=>  Bx_i(3), 
				Ac_i  =>  Carry(2),
				Ac_o	=>  Sx_o(4),
				S_o	=>  Sx_o(3)
			);			
	
	
end rtl;