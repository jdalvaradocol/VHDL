----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2021 09:33:26
-- Design Name: 
-- Module Name: MEF_tb - Behavioral
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

entity MEF_tb is
--  Port ( );
end MEF_tb;

architecture Behavioral of MEF_tb is

signal clk    : std_logic :='0';
signal X      : std_logic_vector(1 downto 0) := "00";
signal Y      : std_logic_vector(3 downto 0) := "0000";
signal estado : std_logic_vector(1 downto 0) := "00";

begin

clk <= not clk after 1 ns;

X <= "00" after 0 ns, "01" after 50 ns, "10" after 100 ns, "11" after 150 ns;

MEF: entity work.MEF_MPAP port map
    (
        clk_i   => clk,
        X       => X,
        Y       => Y,
        estado  => estado
    );

end Behavioral;
