----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2020 16:16:45
-- Design Name: 
-- Module Name: sumador3bits - Behavioral
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

entity sumador3bits is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0));
end sumador3bits;

architecture Behavioral of sumador3bits is

component semisumador is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           Ac : out STD_LOGIC);
end component;

component sumadorcompleto is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Aci : in STD_LOGIC;
           S : out STD_LOGIC;
           Ac : out STD_LOGIC);
end component;

signal AC: STD_LOGIC_VECTOR (1 downto 0);

begin

sum_bit0: semisumador port map (A(0),B(0),S(0),AC(0));
sum_bit1: sumadorcompleto port map (A(1),B(1),AC(0),S(1),AC(1));
sum_bit2: sumadorcompleto port map (A(2),B(2),AC(1),S(2),S(3));


end Behavioral;
