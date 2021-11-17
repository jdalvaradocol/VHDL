----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2021 07:15:29
-- Design Name: 
-- Module Name: FFTR - Behavioral
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

entity FFTR is
    Port (  T,R,clk : in STD_LOGIC;
            Q : out STD_LOGIC );
end FFTR;

architecture Behavioral of FFTR is

signal Q_estado : std_logic;

begin

    process (clk,T,R)
    
    begin

    if R = '1' then
    
        Q_estado <= '1';
        
     elsif rising_edge (clk) and (T = '1') then
     
        Q_estado <= not Q_estado;
        
     elsif rising_edge (clk) and (T = '0') then   
        
        Q_estado <= Q_estado;

        end if;
        
        end process;
        
        Q <= Q_estado;

end Behavioral;
