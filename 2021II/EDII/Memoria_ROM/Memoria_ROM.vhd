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

entity Memoria_ROM is

    generic
    (
        DATA_WIDTH :  natural := 8;
        ADD_WIDTH :  natural  := 5
    );

    Port ( ADD : in STD_LOGIC_VECTOR ((ADD_WIDTH - 1) downto 0);
           DATA : out STD_LOGIC_VECTOR ((DATA_WIDTH - 1) downto 0);
           CLK : in STD_LOGIC);
end Memoria_ROM;

architecture Behavioral of Memoria_ROM is

subtype DATOS is std_logic_vector ((DATA_WIDTH - 1) downto 0);
type ROM_TYPE is array (0 to (2**ADD_WIDTH)-1) of DATOS; 

signal ROM: ROM_TYPE:= (	x"38",x"59",x"7D",x"7F",x"01",x"02",x"03",x"04",
									x"38",x"59",x"7D",x"7F",x"01",x"02",x"03",x"04",
									x"38",x"59",x"7D",x"7F",x"01",x"02",x"03",x"04",
									x"38",x"59",x"7D",x"7F",x"01",x"02",x"03",x"04"
                      ); --DEFINE DATOS DE ROM
								
--signal ROM : ROM_TYPE;
--attribute ram_init_file : string;
--attribute ram_init_file of ROM :
--signal is "memoria.mif";

-- Initializing Block ROM from external data file

 
begin

    process(clk)

    begin
    
        if(rising_edge(clk)) then
        
            DATA <= ROM(conv_integer(ADD)); -- DATA_INT
           
         end if;

    end process;
    
end Behavioral;
