----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.09.2021 14:56:03
-- Design Name: 
-- Module Name: display_opc_C - Behavioral
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

entity display_opc_C is
    Port ( bin_i : in STD_LOGIC_VECTOR (3 downto 0);
           dis_o : out STD_LOGIC_VECTOR (6 downto 0));
end display_opc_C;

architecture Behavioral of display_opc_C is

begin
            
--            g f e d c b a
--            0 1 1 1 1 1 1

dis_o <=  "0111111" when bin_i = "0000" else
          "0000110" when bin_i = "0001" else
          "1011011" when bin_i = "0010" else
          "1001111" when bin_i = "0011" else
          "1100110" when bin_i = "0100" else
          "1101101" when bin_i = "0101" else
          "1111101" when bin_i = "0110" else
          "0000111" when bin_i = "0111" else
          "1111111" when bin_i = "1000" else
          "1101111" when bin_i = "1001" else
          "1110111" when bin_i = "1010" else
          "1111100" when bin_i = "1011" else
          "0111001" when bin_i = "1100" else
          "1001110" when bin_i = "1101" else
          "1111001" when bin_i = "1110" else
          "1110001" when bin_i = "1111" ;  

end Behavioral;
