
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
		port
		(
			Dato_A_i	  	: in	STD_LOGIC_VECTOR( 3 downto 0);
			Dato_B_i	  	: in	STD_LOGIC_VECTOR( 3 downto 0);
			Operacion_i	: in	STD_LOGIC_VECTOR( 1 downto 0);
			Dato_o		: out	STD_LOGIC_VECTOR( 3 downto 0)
		);

end ALU;

architecture behavioral of ALU is   

begin

	Dato_o <= 	Dato_A_i  and Dato_B_i when Operacion_i = "00" else
					Dato_A_i   or Dato_B_i when Operacion_i = "01" else
					Dato_A_i  xor Dato_B_i when Operacion_i = "10" else
					Dato_A_i nand Dato_B_i when Operacion_i = "11" else "0000";

end behavioral;
	