-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port 
	(
		operacaion_i	:  in std_logic_vector(1 downto 0);
		Dato_RL_i		:  in std_logic_vector(3 downto 0);
		Dato_W_i			:  in std_logic_vector(3 downto 0);
		Dato_o			: out std_logic_vector(3 downto 0)
		
);
end ALU;


-- Three possible architectures
architecture rtl of ALU is
begin
		
		Dato_o <= 	Dato_RL_i  and Dato_W_i when operacaion_i = "00" else
						Dato_RL_i   or Dato_W_i when operacaion_i = "01" else
						Dato_RL_i  xor Dato_W_i when operacaion_i = "10" else
						Dato_RL_i nand Dato_W_i when operacaion_i = "11" else "0000";
		
end rtl;
