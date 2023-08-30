----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2021 09:04:26
-- Design Name: 
-- Module Name: unidad_control - Behavioral
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

entity unidad_control is
    Port ( clk_i : in STD_LOGIC;
           add_rom_o : out STD_LOGIC_VECTOR (2 downto 0);
           add_ram_o : out STD_LOGIC_VECTOR (2 downto 0);
           we_ram_o : out STD_LOGIC);
end unidad_control;

architecture Behavioral of unidad_control is

signal estado: INTEGER RANGE 0 TO 20 := 0; --  esto sirve para declarar variables 
signal read_ram: INTEGER RANGE 0 TO 8 := 0; --  esto sirve para declarar variables 

begin

    process(clk_i)
    
    begin
    
    if rising_edge (clk_i) then
    
        if estado = 0 then 
            add_rom_o <= "000";
            estado <= estado + 1; 
        
        elsif estado = 1 then 
            add_rom_o <= "001";
            add_ram_o <= "000";
             we_ram_o <= '0';
             estado <= estado + 1; 
        
        elsif estado = 2 then 
            add_rom_o <= "010";
            add_ram_o <= "001";
             we_ram_o <= '0';
             estado <= estado + 1; 
        
        elsif estado = 3 then 
            add_rom_o <= "011";
            add_ram_o <= "010";
             we_ram_o <= '0';
             estado <= estado + 1;
        
        elsif estado = 4 then 
            add_rom_o <= "100";
            add_ram_o <= "011";
             we_ram_o <= '0';
             estado <= estado + 1;
        
        elsif estado = 5 then 
            add_rom_o <= "101";
            add_ram_o <= "100";
             we_ram_o <= '0';
             estado <= estado + 1;     
        
        elsif estado = 6 then 
            add_rom_o <= "110";
            add_ram_o <= "101";
             we_ram_o <= '0';
             estado <= estado + 1;     
   
        elsif estado = 7 then 
            add_rom_o <= "111";
            add_ram_o <= "110";
             we_ram_o <= '0';
             estado <= estado + 1;
             
        elsif estado = 8 then 
            add_ram_o <= "111";
             we_ram_o <= '0';
             estado <= estado + 1;            
   
       elsif (estado > 8) and (estado < 17)  then 
            add_ram_o <= std_logic_vector(to_unsigned(read_ram,3));
             we_ram_o <= '1';
             estado <= estado + 1;            
             read_ram <= read_ram + 1; 
             
       else
            
            estado <= 0;   
            read_ram <= 0;
                   
        end if; 
         
     end if; 
    
    end process;

end Behavioral;
