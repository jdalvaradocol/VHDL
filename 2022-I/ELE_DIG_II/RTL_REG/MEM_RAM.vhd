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

entity MEM_RAM is

    generic
    (
        DATA_WIDTH :  natural  := 8;
        ADD_WIDTH :   natural  := 5
    );

    Port ( ADD_i 	: in 	STD_LOGIC_VECTOR ((ADD_WIDTH - 1) downto 0);
           DATA_i : in 	STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
			  DATA_o : out STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
           WR_i 	: in 	STD_LOGIC;
			  clk_i 	: in 	STD_LOGIC
			  );
end MEM_RAM;

architecture Behavioral of MEM_RAM is

subtype DATOS is std_logic_vector ((DATA_WIDTH - 1) downto 0);
type RAM_TYPE is array (0 to (2**ADD_WIDTH)-1) of DATOS; 

signal RAM: RAM_TYPE:= (	x"00",x"00",x"00",x"00"
                      ); --DEFINE DATOS DE RAM
					
 
begin

    process(clk_i, WR_i)

    begin
    
        if(rising_edge(clk_i)) then
        
				if WR_i = '0' then -- Lectura
		  
					DATA_o <= RAM(conv_integer(ADD_i)); 
           
				elsif WR_i = '1' then -- escritura
			  
					RAM(conv_integer(ADD_i)) <= DATA_i;
					
				end if;
					
         end if;

    end process;
    
end Behavioral;
