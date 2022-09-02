----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2021 09:22:23
-- Design Name: 
-- Module Name: decodificador - Behavioral
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

entity decodificador is
    Port ( dato_i    : in STD_LOGIC_VECTOR (7 downto 0);
           sel_ope_o : out STD_LOGIC;
           ope_o     : out STD_LOGIC_VECTOR (1 downto 0);
           des_o     : out STD_LOGIC;
           literal_o : out STD_LOGIC_VECTOR (3 downto 0);
           add_ram_o : out STD_LOGIC_VECTOR (1 downto 0));
end decodificador;

architecture Behavioral of decodificador is

begin

ope_o       <= dato_i(7 downto 6);
sel_ope_o   <= dato_i(5);
des_o       <= dato_i(4);
literal_o   <= dato_i(3 downto 0);
add_ram_o   <= dato_i(1 downto 0);

end Behavioral;
