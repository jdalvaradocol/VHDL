----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.08.2021 20:49:23
-- Design Name: 
-- Module Name: add_bit_tb - Behavioral
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

entity add_bit_tb is
end add_bit_tb;

architecture Behavioral of add_bit_tb is

signal ai_tb: std_logic := '0';
signal bi_tb: std_logic := '0';
signal ci_tb: std_logic := '0';
signal so_tb: std_logic := '0';
signal co_tb: std_logic := '0';

begin

    ai_tb <= not ai_tb after 1 ns;
    bi_tb <= not bi_tb after 2 ns;
    ci_tb <= not ci_tb after 4 ns;
    
    add_bit_tb1: entity work.add_bit 
        port map (
                    a_i => ai_tb,
                    b_i => bi_tb,
                    c_i => ci_tb,
                    s_o => so_tb,
                    c_o => co_tb
                  );  


end Behavioral;
