----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2021 08:25:17
-- Design Name: 
-- Module Name: Unidad_control - Behavioral
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

entity Unidad_control is
    Port ( clk_i     : in  STD_LOGIC;
           reset_i   : in  STD_LOGIC;
           wr_i      : in  STD_LOGIC;
           add_rom_o : out STD_LOGIC_VECTOR (2 downto 0);
           wr_o      : out STD_LOGIC);
end Unidad_control;

architecture Behavioral of Unidad_control is

signal estado: integer range 0 to 32 := 0;

begin

    process(clk_i,reset_i)
    
    begin
    
        if rising_edge(clk_i)  then 
        
            if reset_i = '1' then
            
                add_rom_o <= "000";
                estado    <= 0;
                wr_o      <= '0';       
                
            elsif estado = 0 then
            
                add_rom_o <= "000";      -- Lectura Add = 0 Rom
                wr_o      <= '0';        -- RAM en lectura.    
                estado <= estado + 1;
            
            elsif estado = 1 and wr_i = '1'  then
                
                wr_o <= '1';
                    
            end if;
        
        
            
        end if;    
              
    
    end process;    
        



end Behavioral;
