----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2021 20:53:28
-- Design Name: 
-- Module Name: sum4b - Behavioral
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

entity sum4b is
    Port ( a_i  : in STD_LOGIC_VECTOR (3 downto 0);
           b_i  : in STD_LOGIC_VECTOR (3 downto 0);
           cs_i : in STD_LOGIC;
           s_o  : out STD_LOGIC_VECTOR (3 downto 0);
           c_o  : out STD_LOGIC);
end sum4b;

architecture Behavioral of sum4b is

component add_bit is
    Port ( c_i : in STD_LOGIC;
           a_i : in STD_LOGIC;
           b_i : in STD_LOGIC;
           c_o : out STD_LOGIC;
           s_o : out STD_LOGIC);
end component;

signal Cable: STD_LOGIC_VECTOR (2 downto 0); 

begin

sum_bit0: add_bit port map(
                            c_i =>     cs_i,
                            a_i =>   a_i(0),
                            b_i =>   b_i(0),
                            c_o => cable(0),
                            s_o =>   s_o(0) 
                          );

sum_bit1: add_bit port map(
                            c_i => cable(0),
                            a_i =>   a_i(1),
                            b_i =>   b_i(1),
                            c_o => cable(1),
                            s_o =>   s_o(1) 
                          );
                          
sum_bit2: add_bit port map(
                            c_i => cable(1),
                            a_i =>   a_i(2),
                            b_i =>   b_i(2),
                            c_o => cable(2),
                            s_o =>   s_o(2) 
                          ); 

sum_bit3: add_bit port map(
                            c_i => cable(2),
                            a_i =>   a_i(3),
                            b_i =>   b_i(3),
                            c_o =>      c_o,
                            s_o =>   s_o(3)   
                          ); 

end Behavioral;
