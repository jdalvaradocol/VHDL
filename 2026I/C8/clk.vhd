----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:56:25 03/14/2022 
-- Design Name: 
-- Module Name:    clk - CLK 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk is
    Port ( 
				clk_i : in  std_logic;
				clk_div_o : out  std_logic		
			);
end clk;

architecture rtl of clk is

signal contador: integer range 0 to 10000000; --  esto sirve para declarar variables 

signal aux: std_logic:='0'; 

begin

	process(clk_i)

	begin

		if rising_edge(clk_i) then -- gbdtbdh

			contador<=contador+1;

			if contador = 10000000 then 

				aux<= NOT aux;

			end if;

		end if;

	end process;

	clk_div_o <= aux;

end rtl;