----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2022 22:33:17
-- Design Name: 
-- Module Name: RAM - Behavioral
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
use STD.TEXTIO.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEM_ROM is
   generic
   (
		DATA_WIDTH :  natural  := 8;
      ADD_WIDTH  :   natural  := 5
    );
    Port 
	( 
		ADD_i  :  in STD_LOGIC_VECTOR ((ADD_WIDTH - 1) downto 0);
		DATA_o : out STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
		clk_i  :  in STD_LOGIC
	);
end MEM_ROM;

architecture Behavioral of MEM_ROM is

subtype DATOS is std_logic_vector ((DATA_WIDTH - 1) downto 0);
type ROM_TYPE is array (0 to (2**ADD_WIDTH)-1) of DATOS; 

signal ROM: ROM_TYPE:= (	x"0A",x"0B",x"0C",x"0D",x"0E",x"0F",x"10",x"11",
									x"12",x"34",x"85",x"63",x"14",x"41",x"14",x"AA",
									x"FF",x"67",x"EE",x"AA",x"33",x"22",x"66",x"99",
									x"38",x"59",x"7D",x"7F",x"01",x"02",x"03",x"04"
                     		); --DEFINE DATOS DE ROM

begin

    process(clk_i, ADD_i)

    begin
		
      if(rising_edge(clk_i)) then
			DATA_o <= ROM(conv_integer(ADD_i)); 
      end if;

    end process;
    
end Behavioral;
