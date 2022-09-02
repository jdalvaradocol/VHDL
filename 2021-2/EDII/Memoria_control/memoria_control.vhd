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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoria_control is
    Port ( 
				ADD_i : in STD_LOGIC_VECTOR  (4 downto 0);
				DATA_o : out STD_LOGIC_VECTOR (7 downto 0);
				CLK_i : in STD_LOGIC
			 );
end memoria_control;

architecture Behavioral of memoria_control is

component Memoria_ROM is

    generic
    (
        DATA_WIDTH : natural;
         ADD_WIDTH : natural
    );

    Port ( ADD : in STD_LOGIC_VECTOR ((ADD_WIDTH - 1) downto 0);
           DATA : out STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
           CLK : in STD_LOGIC);
end component;
 
begin

memoria: Memoria_ROM 
			generic map
				(
					DATA_WIDTH  => 8,
					ADD_WIDTH	=> 5
				)							
			port map
				( 
					ADD 		=> ADD_i,
					DATA 		=> DATA_o,
					CLK 		=> CLK_i
				);			
							
end Behavioral;