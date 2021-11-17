----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.09.2021 15:08:56
-- Design Name: 
-- Module Name: display_opc_D - Behavioral
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

entity display_opc_D is
    Port ( bin_i : in STD_LOGIC_VECTOR (3 downto 0);
           dis_o : out STD_LOGIC_VECTOR (6 downto 0));
end display_opc_D;

architecture Behavioral of display_opc_D is

begin

    process(bin_i)
    
    begin
    
           if bin_i = "0000" then
            dis_o <= "0111111";    
        elsif bin_i = "0001" then
            dis_o <= "0000110";
        elsif bin_i = "0010" then
            dis_o <= "1011011";     
        elsif bin_i = "0011" then
            dis_o <= "1001111"; 
        elsif bin_i = "0100" then
            dis_o <= "1100110";
         elsif bin_i = "0101" then
            dis_o <= "1101101";       
        elsif bin_i = "0110" then
            dis_o <= "1111101";     
        elsif bin_i = "0111" then
            dis_o <= "0000111";           
        elsif bin_i = "1000" then
            dis_o <= "1111111";           
        elsif bin_i = "1001" then
            dis_o <= "1101111";           
        elsif bin_i = "1010" then
            dis_o <= "1110111";           
        elsif bin_i = "1011" then
            dis_o <= "1111100";           
        elsif bin_i = "1100" then
            dis_o <= "0111001";           
        elsif bin_i = "1101" then
            dis_o <= "1001110";           
        elsif bin_i = "1110" then
            dis_o <= "1111001";           
        elsif bin_i = "1111" then
            dis_o <= "1110001";           
        end if;
    
    end process;
    
end Behavioral;
