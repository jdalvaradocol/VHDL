
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

entity RTL_REG_tb is
    --Port ();
end RTL_REG_tb;

architecture Behavioral of RTL_REG_tb is

signal clk_tb 		: std_logic:= '0';
signal reset_tb 	: std_logic:= '0';

signal data_o_tb : std_logic_vector(7 downto 0):= "00000000";


begin
	
	clk_tb <= 	not clk_tb  after 1 ns;
	
	REG:  entity work.RTL_REG port map
	(		 
		clk_i		 	=>  clk_tb		,
		reset_i		=>  reset_tb	,
		data_ram_o	=>  data_o_tb	
	);
    
end Behavioral;
