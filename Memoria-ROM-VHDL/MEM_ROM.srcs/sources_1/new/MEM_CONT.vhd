----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2021 07:34:22
-- Design Name: 
-- Module Name: MEM_CONT - Behavioral
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

entity MEM_CONT is
    Port (  clk :  in std_logic;
            DATA : out std_logic_vector (3 downto 0));
end MEM_CONT;

architecture Behavioral of MEM_CONT is

component Contador is
    Port (  clk : in std_logic;
            salida : out std_logic_vector(3 downto 0));
end component;

component Reloj is
    Port ( CLK : in  STD_LOGIC;
           CLKDV : out  STD_LOGIC);
end component;

component ROM16x4 is
    generic
    (   Data_width : natural ;
        Add_width  : natural );   

    Port ( ADD : in STD_LOGIC_VECTOR ((Add_width-1) downto 0);
           DATA : out STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           clk : in STD_LOGIC);
end component;

signal clk_div : std_logic; 
signal cont : std_logic_vector(3 downto 0); 
signal Data_out : std_logic_vector(3 downto 0); 

begin

clk_div0: reloj port map (clk,clk_div);

ContA: Contador port map (clk_div,cont);
  MEM: ROM16x4 generic map (4,4) port map(cont,Data_out,clk_div);
  
DATA <=  Data_out; 

end Behavioral;
