----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.09.2021 14:41:38
-- Design Name: 
-- Module Name: display_opc_B - Behavioral
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

entity display_opc_B is
    Port ( bin_i : in STD_LOGIC_VECTOR (3 downto 0);
           dis_o : out STD_LOGIC_VECTOR (6 downto 0));
end display_opc_B;

-- bin_i : in STD_LOGIC_VECTOR (3 downto 0)
--  A_i         B_i         C_i         D_i
--  bin_i(3)    bin_i(2)    bin_i(1)    bin_i(0)

-- bin_i : in STD_LOGIC_VECTOR (0 to 3)
--  A_i         B_i         C_i         D_i
--  bin_i(0)    bin_i(1)    bin_i(2)    bin_i(3)

architecture Behavioral of display_opc_B is

begin
    dis_o(6) <=  (not(bin_i(2)) and bin_i(1)) or 
                  (bin_i(3) and not(bin_i(2))) or 
                 (not(bin_i(3)) and bin_i(2) and not(bin_i(1))) or                  
                 (bin_i(1) and not(bin_i(0))) or 
                 (bin_i(3) and bin_i(0));
    dis_o(5) <=  (not(bin_i(3)) and bin_i(2) and not(bin_i(1))) or 
                 (not(bin_i(1)) and not(bin_i(0))) or 
                 (bin_i(2) and not(bin_i(0))) or 
                 (bin_i(3) and not(bin_i(2))) or 
                 (bin_i(3) and bin_i(1));
    dis_o(4) <=  (not(bin_i(2)) and not(bin_i(0)))or
                 (bin_i(1) and not(bin_i(0))) or 
                 (bin_i(3) and not(bin_i(0))) or 
                 (bin_i(3) and bin_i(1));
    dis_o(3) <=  (not(bin_i(3)) and not(bin_i(2)) and not(bin_i(0))) or 
                 (not(bin_i(2)) and bin_i(1) and bin_i(0)) or 
                 (bin_i(2) and not(bin_i(1)) and bin_i(0)) or 
                 (bin_i(2) and bin_i(1) and not(bin_i(0))) or (bin_i(3) and not(bin_i(1)));
    dis_o(2) <=  (not(bin_i(2)) and not(bin_i(1))) or 
                 (not(bin_i(2)) and bin_i(0)) or 
                 (not(bin_i(1)) and bin_i(0)) or 
                 (not(bin_i(3)) and bin_i(2)) or
                 (bin_i(3) and not(bin_i(2)));
    dis_o(1) <=  (not(bin_i(3)) and not(bin_i(1)) and not(bin_i(0))) or 
                 (not(bin_i(3)) and bin_i(1) and bin_i(0)) or 
                 (bin_i(3) and not(bin_i(1)) and bin_i(0)) or 
                 (not(bin_i(2)) and not(bin_i(1))) or 
                 (not(bin_i(2)) and not(bin_i(0)));
    dis_o(0) <=  (bin_i(3) and not(bin_i(2)) and not(bin_i(1))) or 
                 (not(bin_i(3)) and bin_i(2) and bin_i(0)) or 
                 (not(bin_i(2)) and not(bin_i(0))) or
                 (not(bin_i(3)) and bin_i(1)) or 
                 (bin_i(3) and not(bin_i(0))) or 
                 (bin_i(2) and bin_i(1));

end Behavioral;
