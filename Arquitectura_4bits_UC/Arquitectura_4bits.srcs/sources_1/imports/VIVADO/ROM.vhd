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
        Data_width : natural ;
        Add_width  : natural 
    );
    
    Port ( ADD : in STD_LOGIC_VECTOR ((Add_width-1) downto 0);
           DATA : out STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           clk : in STD_LOGIC);
end ROM;

architecture Behavioral of ROM is

subtype Datos is std_logic_vector ((Data_width-1) downto 0);
type ROM_TYPE is array (0 to (2**Add_width)-1) of Datos;

-- Operacaion 2 bits.
-- 00 and
-- 01 or
-- 10 xor
-- 11 mov 

-- 0peradores 1 bit.
--  0 W -> L
--  1 W -> R

-- Destino 1 bit.
-- 0 -> W
-- 1 -> R

-- Registro o literal 4 bits.
-- Direccion del registro -> R
-- El valor del literal -> L

-- 11 0 0 1010 (  W = L(10)      ) --- W  = 10
-- 01 0 0 1111 (  W = W or L(15) ) --- W  = 15
-- 11 0 0 0011 (  W = L(3)       ) --- W  = 3
-- 11 1 1 0001 ( R1 = W          ) --- R1 = 3
-- 11 0 0 1111 (  W = L(15)      ) --- W  = 15
-- 10 1 0 0001 (  W = W xor R1   ) --- W  = 12
-- 00 0 0 1010 (  W = W and L(10)) --- W  = 8

signal ROM_data: ROM_TYPE :=   ("11001010","01001111",
                                "11000011","11110001",
                                "11001111","10100001",
                                "00001010","00000000"); 
begin

    process(clk)
    
    begin
    
        if(rising_edge(clk)) then
            
            DATA <= ROM_data(conv_integer(ADD)); -- Leer Dato DATA INT
            
        end if;
        
    end process;
    
end Behavioral;
