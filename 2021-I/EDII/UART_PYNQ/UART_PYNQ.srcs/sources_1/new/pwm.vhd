----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2021 22:10:30
-- Design Name: 
-- Module Name: pwm - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm is
    Port (      clk_i : in STD_LOGIC;
            periodo_i : in STD_LOGIC_VECTOR (27 downto 0);
               duty_i : in STD_LOGIC_VECTOR (27 downto 0);
                pwm_o : out STD_LOGIC);
end pwm;

architecture Behavioral of pwm is

signal contador: integer :=0; 
signal  periodo: integer :=0; 
signal     duty: integer :=0; 

signal aux: STD_LOGIC := '0'; 

begin

        periodo <= to_integer(unsigned(periodo_i));
           duty <= to_integer(unsigned(   duty_i));

    process(clk_i, aux)

    begin

    if rising_edge(clk_i) then  

    contador <= contador + 1;

        if contador < duty then 

            aux<= '1';

        elsif contador < periodo then
        
            aux<= '0';
        
        else 
            
            contador <= 0;
           
        end if;

    end if;
    
    pwm_o <= aux;


    end process;

end Behavioral;
