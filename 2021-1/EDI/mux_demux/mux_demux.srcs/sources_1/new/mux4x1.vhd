----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2021 14:15:28
-- Design Name: 
-- Module Name: mux4x1 - Behavioral
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

entity mux4x1 is
    Port ( sel_i     : in STD_LOGIC_VECTOR (1 downto 0);
           entrada_i : in STD_LOGIC_VECTOR (3 downto 0);
           salida_o  : out STD_LOGIC);
end mux4x1;

architecture Behavioral of mux4x1 is

begin

salida_o <= entrada_i(0) when sel_i = "00" else
            entrada_i(1) when sel_i = "01" else
            entrada_i(2) when sel_i = "10" else 
            entrada_i(3) when sel_i = "11";

end Behavioral;
