
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2021 22:33:17
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MEM_ROM_tb is
    --Port ();
end MEM_ROM_tb;

architecture Behavioral of MEM_ROM_tb is

signal clk_tb : std_logic:= '0';
signal data_tb : std_logic_vector(7 downto 0):= "00000000";
signal add_tb : std_logic_vector(4 downto 0):= "00000";

begin
	
	clk_tb <= 	not clk_tb  after 1 ns;
	add_tb <=  add_tb + '1' after 2 ns;

	Memoria:  entity work.MEM_ROM port map
	(
		 ADD_i 	=> add_tb, 
		 DATA_o =>  data_tb,
		 clk_i =>   clk_tb	
	);
    
end Behavioral;
