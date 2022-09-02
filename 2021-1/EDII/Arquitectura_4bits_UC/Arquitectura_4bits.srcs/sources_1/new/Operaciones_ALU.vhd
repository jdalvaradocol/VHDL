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
           dato_ALU_i : in STD_LOGIC_VECTOR (3 downto 0);
           wreg_i     : in STD_LOGIC_VECTOR (3 downto 0);
           Dato_o     : out STD_LOGIC_VECTOR (3 downto 0)
          );
end Operaciones_ALU;

architecture Behavioral of Operaciones_ALU is

begin
        
    Dato_o <= dato_ALU_i and wreg_i when ope_i = "00" else
              dato_ALU_i  or wreg_i when ope_i = "01" else
              dato_ALU_i xor wreg_i when ope_i = "10" else
              dato_ALU_i            when ope_i = "11" else "0000";                                              
         
end Behavioral;
