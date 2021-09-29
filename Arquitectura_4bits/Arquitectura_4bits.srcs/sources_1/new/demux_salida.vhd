----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2021 07:42:38
-- Design Name: 
-- Module Name: demux_salida - Behavioral
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

entity demux_salida is
    Port ( sel_i : in STD_LOGIC;
           dato_ope_i : in STD_LOGIC_VECTOR (3 downto 0);
           wreg_i : in STD_LOGIC_VECTOR (3 downto 0);
           wreg_o : out STD_LOGIC_VECTOR (3 downto 0);
           registro_o : out STD_LOGIC_VECTOR (3 downto 0));
end demux_salida;

architecture Behavioral of demux_salida is

begin

    wreg_o <= dato_ope_i when sel_i = '0' else wreg_i;
    registro_o <= dato_ope_i when sel_i = '1' else "0000";

end Behavioral;
