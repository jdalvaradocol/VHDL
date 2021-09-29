----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2021 14:15:28
-- Design Name: 
-- Module Name: demux1x4 - Behavioral
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

entity demux1x4 is
    Port ( sel_i : in STD_LOGIC_VECTOR (1 downto 0);
           entrada_i : in STD_LOGIC;
           salida_o : out STD_LOGIC_VECTOR (3 downto 0));
end demux1x4;

architecture Behavioral of demux1x4 is

begin

    salida_o (0) <= entrada_i when sel_i = "00" else '0';
    salida_o (1) <= entrada_i when sel_i = "01" else '0';
    salida_o (2) <= entrada_i when sel_i = "10" else '0';
    salida_o (3) <= entrada_i when sel_i = "11" else '0';

end Behavioral;
