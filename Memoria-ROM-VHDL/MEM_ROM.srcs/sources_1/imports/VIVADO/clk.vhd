----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:56:25 03/14/2010 
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

entity Reloj is
    Port ( CLK : in  STD_LOGIC;
           CLKDV : out  STD_LOGIC);
end Reloj;

architecture clk of Reloj is

signal contador: INTEGER RANGE 0 TO 10000000; --  esto sirve para declarar variables 

signal aux: STD_LOGIC:='0'; 

begin

process(CLK)

BEGIN

    IF RISING_EDGE(clk) THEN -- gbdtbdh

        contador<=contador+1;

    IF CONTADOR = 10000000 THEN 

        aux<= NOT aux;

        CLKDV <= aux;

    end if;

    end if;

END PROCESS;

end clk;