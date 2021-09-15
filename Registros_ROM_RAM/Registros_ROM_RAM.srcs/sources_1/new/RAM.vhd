----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2021 08:47:42
-- Design Name: 
-- Module Name: ROM16x4 - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    generic
    (
        Data_width : natural;
        Add_width  : natural 
    );
    
    Port ( add_i    :  in STD_LOGIC_VECTOR ((Add_width-1) downto 0);
           Data_i   :  in STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           Data_o   :  out STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           WE_i     :  in STD_LOGIC;
           clk_i    :  in STD_LOGIC);
end RAM;

architecture Behavioral of RAM is

subtype Datos is std_logic_vector ((Data_width-1) downto 0);
type RAM_TYPE is array (0 to (2**Add_width)-1) of Datos;

signal RAM: RAM_TYPE := ("0000","0000","0000","0000",
                         "0000","0000","0000","0000"); 

-- WE = 1 Lectura 
-- WE = 0 escritura 

begin

    process(clk_i, WE_i)
    
    begin
    
        if  rising_edge(clk_i) then 
        
            if (WE_i = '1')  then
          
                Data_o <= RAM(conv_integer(add_i)); -- Leer Dato DATA INT
            
            elsif  (WE_i = '0')  then

                RAM(conv_integer(add_i)) <= Data_i;
            
            end if;
       
                       
        end if;
        
    end process;
    
end Behavioral;
