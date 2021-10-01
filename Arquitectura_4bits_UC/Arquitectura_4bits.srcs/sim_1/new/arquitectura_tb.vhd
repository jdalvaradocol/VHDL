----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2021 11:12:24
-- Design Name: 
-- Module Name: arquitectura_tb - Behavioral
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

entity arquitectura_tb is
--  Port ( );
end arquitectura_tb;

architecture Behavioral of arquitectura_tb is

component arquitectura is
    Port ( clk_i        : in STD_LOGIC;
           reset_i      : in STD_LOGIC;
           data_rom_o   : out STD_LOGIC_VECTOR (7 downto 0);
           result_o     : out STD_LOGIC_VECTOR (3 downto 0);
           wreg_o       : out STD_LOGIC_VECTOR (3 downto 0);
           data_ram_o   : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal clk_tb       : std_logic := '0';
signal reset_tb     : std_logic := '0';
signal data_rom_tb  : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal result_tb    : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal wreg_tb      : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal data_ram_tb  : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

clk_tb <= not clk_tb after 1 ns;

arq_tb: arquitectura port map 
    (
        clk_i       =>  clk_tb,
        reset_i     =>  reset_tb,
        data_rom_o  =>  data_rom_tb,
        result_o    =>  result_tb,
        wreg_o      =>  wreg_tb,
        data_ram_o  =>  data_ram_tb 
    );

end Behavioral;
