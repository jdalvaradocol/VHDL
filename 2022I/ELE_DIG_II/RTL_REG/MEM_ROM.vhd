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
        DATA_WIDTH :  natural  := 0;
        ADD_WIDTH :   natural  := 0
    );

    Port ( ADD_i : in STD_LOGIC_VECTOR ((ADD_WIDTH - 1) downto 0);
           DATA_o : out STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
           clk_i : in STD_LOGIC);
end MEM_ROM;

architecture Behavioral of MEM_ROM is

subtype DATOS is std_logic_vector ((DATA_WIDTH - 1) downto 0);
type ROM_TYPE is array (0 to (2**ADD_WIDTH)-1) of DATOS; 

signal ROM: ROM_TYPE:= (	
									x"0A",x"0B",x"0C",x"0D"
								); --DEFINE DATOS DE ROM
					


-- Initializing Block ROM from external data file

 
begin

    process(clk_i)

    begin
    
        if(rising_edge(clk_i)) then
        
            DATA_o <= ROM(conv_integer(ADD_i)); -- DATA_INT
           
         end if;

    end process;
    
end Behavioral;
