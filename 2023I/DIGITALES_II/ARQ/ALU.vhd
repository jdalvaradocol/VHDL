-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port 
	(
		operacaion_i :  in std_logic_vector(1 downto 0);
		alu_A_i		 :  in std_logic_vector(3 downto 0);
		alu_B_i		 :  in std_logic_vector(3 downto 0);
		dato_o		 : out std_logic_vector(3 downto 0)	
	);
end ALU;

-- Three possible architectures
architecture rtl of ALU is
begin
		
	dato_o <= 	alu_A_i  and alu_B_i when operacaion_i = "00" else
					alu_A_i   or alu_B_i when operacaion_i = "01" else
					alu_A_i  xor alu_B_i when operacaion_i = "10" else
					alu_A_i nand alu_B_i when operacaion_i = "11" else "0000";
		
end rtl;
