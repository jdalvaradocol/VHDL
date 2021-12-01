----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2021 08:54:55
-- Design Name: 
-- Module Name: MEF_MPAP - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEF_MPAP is
    Port ( clk_i : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           estado : out STD_LOGIC_VECTOR (1 downto 0));
end MEF_MPAP;

architecture Behavioral of MEF_MPAP is

signal state : integer range 0 to 3 := 0;

begin

    MEF:process (clk_i)
    
    begin
    
        if rising_edge (clk_i) then

            if X = "00" and X = "11" then 
            
                state <= state;
                
             elsif  X = "01" then
             
                state <= state + 1;
                
             elsif  X = "10" then
                   
                state <= state - 1;

            end if;
            
        end if;

    end process;

  salida_MEF:process (clk_i)
    
    begin
    
        if rising_edge (clk_i) then

            if state = 0 then
            
                Y <= "0001";
                
            elsif state = 1 then
                
                Y <= "0010";
                
            elsif state = 2 then
                
                Y <= "0100";
                
            elsif state = 3 then
                
                Y <= "1000";
                
            end if;

        end if;

    end process;

estado <= std_logic_vector(TO_UNSIGNED(state,2));

end Behavioral;
