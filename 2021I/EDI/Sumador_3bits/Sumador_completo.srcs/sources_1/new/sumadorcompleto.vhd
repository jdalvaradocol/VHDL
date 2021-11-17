----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2020 15:57:02
-- Design Name: 
-- Module Name: sumadorcompleto - Behavioral
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

entity sumadorcompleto is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Aci : in STD_LOGIC;
           S : out STD_LOGIC;
           Ac : out STD_LOGIC);
end sumadorcompleto;

architecture Behavioral of sumadorcompleto is

begin

S <= A xor B xor Aci;
Ac <= (A and B)or(A and Aci)or(B and Aci);

end Behavioral;
