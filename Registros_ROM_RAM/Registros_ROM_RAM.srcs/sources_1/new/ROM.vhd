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

entity ROM is
    generic
    (
        Data_width : natural := 4;
        Add_width  : natural := 3
    );
    
    Port ( ADD : in STD_LOGIC_VECTOR ((Add_width-1) downto 0);
           DATA : out STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           clk : in STD_LOGIC);
end ROM;

architecture Behavioral of ROM is

subtype Datos is std_logic_vector ((Data_width-1) downto 0);
type ROM_TYPE is array (0 to (2**Add_width)-1) of Datos;

signal ROM_data: ROM_TYPE :=   ("1111","1110","1101","1100",
                                "1011","1010","1001","1000"); 
begin

    process(clk)
    
    begin
    
        if(rising_edge(clk)) then
            
            DATA <= ROM_data(conv_integer(ADD)); -- Leer Dato DATA INT
            
        end if;
        
    end process;
    
end Behavioral;
