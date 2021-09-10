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

entity ROM16x4 is
    generic
    (
        Data_width : natural;
        Add_width  : natural 
    );
    
    Port ( ADD : in STD_LOGIC_VECTOR ((Add_width-1) downto 0);
           DATA : out STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           clk : in STD_LOGIC);
end ROM16x4;

architecture Behavioral of ROM16x4 is

--subtype Datos is std_logic_vector ((Data_width-1) downto 0);
--type ROM_TYPE is array (0 to (2**Add_width)-1) of Datos;
--
--signal ROM: ROM_TYPE := ("1111","1110","1101","1100",
--                         "1011","1010","1001","1000",
--                         "0111","0110","0101","0100",
--                         "0011","0010","0001","0000"); 

subtype Datos is bit_vector ((Data_width-1) downto 0);
type ROM_TYPE is array (0 to (2**Add_width)-1) of Datos;

impure function initRomFromFile (RomFileName : in string) return ROM_TYPE is

FILE     RomFile        : text is in RomFileName;
variable RomFileLine    : line;
variable ROM            : ROM_TYPE;

begin

for i in ROM_TYPE'range loop
    
    readline(RomFile,RomFileLine);
    read(RomFileLine, ROM(i));
  
end loop;
return ROM;
end function;

signal ROM : ROM_TYPE := initRomFromFile("E:/Cloud/OneDrive - Universidad de Cundinamarca/Programacion/VIVADO/MEM_ROM/rom_file_init.data");

begin

    process(clk)
    
    begin
    
        if(rising_edge(clk)) then
            
            --DATA <= ROM(conv_integer(ADD)); -- Leer Dato DATA INT
            
            DATA <= to_stdlogicvector(ROM(conv_integer(ADD))); -- DATA EXT
            
        end if;
        
    end process;
    
end Behavioral;
