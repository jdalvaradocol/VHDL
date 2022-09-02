----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2021 07:14:11
-- Design Name: 
-- Module Name: Registros_tb - Behavioral
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

entity Registros_tb is
--  Port ( );
end Registros_tb;

architecture Behavioral of Registros_tb is

signal clk_tb: std_logic := '0';
signal data_tb: std_logic_vector(3 downto 0) := "0000";

begin

clk_tb <= not clk_tb after 1 ns;

Reg_tb: entity work.Registros port map (
                                    clk_i => clk_tb,
                                    data_o => data_tb
                                ); 


end Behavioral;
