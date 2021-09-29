----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2021 09:17:33
-- Design Name: 
-- Module Name: registro_w - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registro_w is
    Port ( 
            clk_i : in STD_LOGIC;
            wreg_i : in STD_LOGIC_VECTOR (3 downto 0);
            wreg_alu_o : out STD_LOGIC_VECTOR (3 downto 0);
            wreg_demux_o : out STD_LOGIC_VECTOR (3 downto 0));
end registro_w;

architecture Behavioral of registro_w is

begin

    process(clk_i)

    begin
        
        if rising_edge(clk_i) then 
        
            wreg_alu_o <= wreg_i;
            wreg_demux_o <= wreg_i;
        
        end if;
        
    end process;    

end Behavioral;
