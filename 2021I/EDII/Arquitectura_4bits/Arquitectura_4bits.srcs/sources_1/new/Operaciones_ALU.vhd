----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2021 09:34:33
-- Design Name: 
-- Module Name: Operaciones_ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Operaciones_ALU is
    Port ( ope_i      : in STD_LOGIC_VECTOR (1 downto 0);
           sel_ope_i  : in STD_LOGIC;
           des_i      : in STD_LOGIC;
           Literal_i  : in STD_LOGIC_VECTOR (3 downto 0);
           Registro_i : in STD_LOGIC_VECTOR (3 downto 0);
           wreg_i     : in STD_LOGIC_VECTOR (3 downto 0);
           Dato_o     : out STD_LOGIC_VECTOR (3 downto 0)
          );
end Operaciones_ALU;

architecture Behavioral of Operaciones_ALU is

signal dato_A : std_logic_vector(3 downto 0) := "0000"; 
signal dato_B : std_logic_vector(3 downto 0) := "0000"; 

begin

dato_A <= Literal_i when sel_ope_i = '0' else Registro_i;
dato_B <= Literal_i when sel_ope_i = '0' else wreg_i;

Dato_o <= dato_A and wreg_i when ope_i = "00" else
          dato_A  or wreg_i when ope_i = "01" else
          dato_A xor wreg_i when ope_i = "10" else
          dato_B            when ope_i = "11" else "0000" ;                                              
 
end Behavioral;
