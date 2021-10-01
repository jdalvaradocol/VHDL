----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2020 12:31:36
-- Design Name: 
-- Module Name: sumador_4bits - Behavioral
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

entity sumador_4bits is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (4 downto 0));
end sumador_4bits;

architecture Behavioral of sumador_4bits is

component sumador_completo is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Ci : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC);
end component;

component semi_sumador is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           C : out STD_LOGIC);
end component;

signal C: STD_LOGIC_VECTOR (2 downto 0);

begin

sum_bit0: semi_sumador port map( A(0), B(0), S(0), C(0));
sum_bit1: sumador_completo port map( A(1), B(1), C(0), S(1), C(1));
sum_bit2: sumador_completo port map( A(2), B(2), C(1), S(2), C(2));
sum_bit3: sumador_completo port map( A(3), B(3), C(2), S(3), S(4));

end Behavioral;
