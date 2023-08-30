----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2021 07:41:06
-- Design Name: 
-- Module Name: FFD - Behavioral
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

entity FFD is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end FFD;

architecture Behavioral of FFD is

signal Ds : std_logic := '0';

begin

process (clk,D)

begin
  
    if rising_edge (clk) then
    
        Ds <= D;
                  
    end if;
           
end process;

Q <=  Ds;

end Behavioral;
