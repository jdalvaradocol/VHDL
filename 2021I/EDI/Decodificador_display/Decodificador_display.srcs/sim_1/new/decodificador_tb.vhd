----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.09.2021 15:32:40
-- Design Name: 
-- Module Name: decodificador_tb - Behavioral
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

entity decodificador_tb is
--  Port ( );
end decodificador_tb;

architecture Behavioral of decodificador_tb is

signal entrada_tb : std_logic_vector(3 downto 0):= "0000";
signal salidaA_tb : std_logic_vector(6 downto 0):= "0000000";
signal salidaB_tb : std_logic_vector(6 downto 0):= "0000000";
signal salidaC_tb : std_logic_vector(6 downto 0):= "0000000";
signal salidaD_tb : std_logic_vector(6 downto 0):= "0000000";

begin

    entrada_tb(0) <= not entrada_tb(0) after 1 ns;
    entrada_tb(1) <= not entrada_tb(1) after 2 ns;
    entrada_tb(2) <= not entrada_tb(2) after 4 ns;
    entrada_tb(3) <= not entrada_tb(3) after 8 ns;

    deco_tb: entity work.decodificador port map (
                                            entrada => entrada_tb,
                                            salida_A => salidaA_tb,
                                            salida_B => salidaB_tb,
                                            salida_C => salidaC_tb,
                                            salida_D => salidaD_tb
                                        );


end Behavioral;
