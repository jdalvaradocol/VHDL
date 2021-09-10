----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2021 07:24:34
-- Design Name: 
-- Module Name: Contador - Behavioral
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

entity Contador is
    Port (  clk : in std_logic;
            salida : out std_logic_vector(3 downto 0)    
            );
end Contador;

architecture Behavioral of Contador is

component FFTR is
    Port (  T,R,clk : in STD_LOGIC;
            Q : out STD_LOGIC );
end component;

signal reset : std_logic := '0';
signal contador: std_logic_vector (3 downto 0) := "1111";

begin

bit0: FFTR port map ('1',reset,clk,contador(0));
bit1: FFTR port map ('1',reset,contador(0),contador(1));
bit2: FFTR port map ('1',reset,contador(1),contador(2));
bit3: FFTR port map ('1',reset,contador(2),contador(3));

reset <= '0';

salida <= not contador;

end Behavioral;
