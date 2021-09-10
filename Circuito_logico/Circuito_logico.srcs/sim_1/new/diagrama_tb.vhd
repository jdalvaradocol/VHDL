----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2021 14:21:46
-- Design Name: 
-- Module Name: diagrama_tb - Behavioral
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

entity diagrama_tb is
--  Port ( );
end diagrama_tb;

architecture Behavioral of diagrama_tb is

signal a_tb : std_logic :='0'; 
signal b_tb : std_logic :='0';
signal c_tb : std_logic :='0';
signal d_tb : std_logic :='0';
signal x_tb : std_logic :='0';

begin

a_tb <= not a_tb after 8 ns;
b_tb <= not b_tb after 4 ns;
c_tb <= not c_tb after 2 ns;
d_tb <= not d_tb after 1 ns;

diagrama_tb_sim: entity work.diagrama port map(
                                                A => a_tb,
                                                B => b_tb,
                                                C => c_tb,
                                                D => d_tb,
                                                x => x_tb
                                                );

end Behavioral;
