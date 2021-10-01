----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2021 08:25:17
-- Design Name: 
-- Module Name: Unidad_control - Behavioral
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
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Unidad_control is
    Port ( clk_i        :  in STD_LOGIC;
           reset_i      :  in STD_LOGIC;
           data_alu_i   :  in STD_LOGIC_VECTOR (3 downto 0);
           data_ram_i   :  in STD_LOGIC_VECTOR (3 downto 0);
           data_rom_i   :  in STD_LOGIC_VECTOR (7 downto 0);
           wreg_i       :  in STD_LOGIC_VECTOR (3 downto 0);
           operacaion_o : out STD_LOGIC_VECTOR (1 downto 0);
           dato_ALU_o   : out STD_LOGIC_VECTOR (3 downto 0);
           wreg_o       : out STD_LOGIC_VECTOR (3 downto 0);
           add_rom_o    : out STD_LOGIC_VECTOR (2 downto 0);
           data_ram_o   : out STD_LOGIC_VECTOR (3 downto 0);
           add_ram_o    : out STD_LOGIC_VECTOR (1 downto 0);
           wr_o         : out STD_LOGIC);
end Unidad_control;

architecture Behavioral of Unidad_control is

signal estado   : integer range 0 to 32 := 32;
signal add_rom  : integer range 0 to 32 := 32;
signal init     : integer range 0 to 1  := 0;

begin

    process(clk_i,reset_i)
    
    begin
    
        if rising_edge(clk_i)  then 
        
            if reset_i = '1' then
            
                add_rom_o    <= "000";
                estado       <= 0;
                wr_o         <= '0';
                add_rom      <= 0;       
                operacaion_o <= "00";
                dato_ALU_o   <= "0000";
                data_ram_o   <= "0000";
                add_ram_o    <= "00";
                wreg_o       <= "0000";
            
            elsif init = 0 then
            
                add_rom_o    <= "000";
                estado       <= 0;
                wr_o         <= '0';
                add_rom      <= 0;       
                operacaion_o <= "00";
                dato_ALU_o   <= "0000";
                data_ram_o   <= "0000";
                add_ram_o    <= "00";
                wreg_o       <= "0000";
                init <= 1;
                           
            elsif estado = 0 then
            
                add_rom_o    <= std_logic_vector(to_unsigned(add_rom,3));      -- Lectura Add = 0 Rom
                estado       <= estado + 1;

            elsif estado = 1 then
                
                estado      <= estado + 1;
                add_rom      <= add_rom + 1;
                
            elsif estado = 2 then
                
                add_ram_o   <= data_rom_i(1 downto 0);
                wr_o        <= '1';
                estado      <= estado + 1;
   
             elsif estado = 3 then
                
                estado      <= estado + 1;
                
             elsif estado = 4 then
                               
                    if data_rom_i(7 downto 6) = "11" then 
                    
                        if data_rom_i(4) = '0' then
                            dato_ALU_o <= data_rom_i(3 downto 0);
                        else
                            dato_ALU_o <= wreg_i; 
                        end if;
                
                    else    
                
                        if data_rom_i(5) = '0' then
                            dato_ALU_o <= data_rom_i(3 downto 0);
                        else
                            dato_ALU_o <= data_ram_i; 
                        end if;
                    
                end if;    
                    
                operacaion_o <= data_rom_i(7 downto 6);
                estado  <= estado + 1;
               
             elsif estado = 5 then
               
                if data_rom_i(4) = '0' then
                    wreg_o      <= data_alu_i;
                else
                    data_ram_o  <= data_alu_i; 
                    wr_o        <= '0';
                end if; 
                
                estado  <= estado + 1;    
                
            elsif estado = 6 then
                
                estado  <= 0;
         
            
            end if;
        
            if add_rom > 8 then
                
                add_rom <= 0;
                           
            end if;    
                
        end if;    
    
    end process;    
        
end Behavioral;
