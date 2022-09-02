----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2021 08:06:56
-- Design Name: 
-- Module Name: MEF_MPAP_tb - Behavioral
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

entity MEF_MPAP_tb is
--  Port ( );
end MEF_MPAP_tb;

architecture Behavioral of MEF_MPAP_tb is

signal F : std_logic_vector (1 downto 0) := "00";
signal Y : std_logic_vector (3 downto 0) := "0000";

signal X : std_logic_vector (1 downto 0) := "00";
signal clk : std_logic := '0';

begin

clk <= not clk after 1 ns;

X <= "00" after 0 ns,
     "01" after 20 ns ,
     "10" after 40 ns ,
     "11" after 60 ns ;

MEF_tb: entity work.MEF_MPAP port map 
            (       
                X_i    => X ,
                clk_i  => clk,
                FF_o   => F,
                Y_o    => Y        
             ); 

end Behavioral;
