----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.08.2021 20:22:49
-- Design Name: 
-- Module Name: add_bit - Behavioral
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

entity add_bit is
    Port ( c_i : in STD_LOGIC;
           a_i : in STD_LOGIC;
           b_i : in STD_LOGIC;
           c_o : out STD_LOGIC;
           s_o : out STD_LOGIC);
end add_bit;

architecture Behavioral of add_bit is

begin

-- y = BC + AC + AB
-- y -> c_o 
-- A -> a_i
-- B -> b_i
-- C -> c_i

c_o <= (b_i and c_i) or (a_i and c_i) or (a_i and b_i);
s_o <= a_i xor b_i xor c_i;      

end Behavioral;
