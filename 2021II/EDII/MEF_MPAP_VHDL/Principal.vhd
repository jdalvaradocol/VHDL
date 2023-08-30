----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2021 09:10:04
-- Design Name: 
-- Module Name: Principal - Behavioral
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

entity Principal is
    Port ( clk_i : in STD_LOGIC;
           X_i : in STD_LOGIC_VECTOR (1 downto 0);
           Y_o : out STD_LOGIC_VECTOR (3 downto 0);
           estado_o : out STD_LOGIC_VECTOR (1 downto 0));
end Principal;

architecture Behavioral of Principal is

component Reloj is
    Port ( CLK : in  STD_LOGIC;
           CLKDV : out  STD_LOGIC);
end component;

component MEF_MPAP is
    Port ( clk_i : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           estado : out STD_LOGIC_VECTOR (1 downto 0));
end component;

signal clk_dv : std_logic := '0';

begin

clk_div: Reloj port map
        (
            CLK     => clk_i,
            CLKDV   => clk_dv
        );

MEF: MEF_MPAP port map
        ( 
            clk_i   =>  clk_dv,
            X       =>  X_i,
            Y       =>  Y_o,
            estado  =>  estado_o
        );

end Behavioral;
