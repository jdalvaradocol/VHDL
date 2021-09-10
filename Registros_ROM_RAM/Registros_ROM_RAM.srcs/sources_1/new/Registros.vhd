----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2021 09:31:28
-- Design Name: 
-- Module Name: Registros - Behavioral
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

entity Registros is
    Port ( clk_i : in STD_LOGIC;
           data_o : out STD_LOGIC_VECTOR (3 downto 0));
end Registros;

architecture Behavioral of Registros is

component RAM is
    generic
    (
        Data_width : natural := 4;
        Add_width  : natural := 3
    );
    
    Port ( add_i    :  in STD_LOGIC_VECTOR ((Add_width-1) downto 0);
           Data_i   :  in STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           Data_o   :  out STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           WE_i     :  in STD_LOGIC;
           clk_i    :  in STD_LOGIC);
end component;

component ROM is
    generic
    (
        Data_width : natural := 4;
        Add_width  : natural := 3
    );
    
    Port ( ADD : in STD_LOGIC_VECTOR ((Add_width-1) downto 0);
           DATA : out STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           clk : in STD_LOGIC);
end component;

component operacion is
    Port ( data_i : in STD_LOGIC_VECTOR (3 downto 0);
           data_o : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Reloj is
    Port ( CLK : in  STD_LOGIC;
           CLKDV : out  STD_LOGIC);
end component;

component unidad_control is
    Port ( clk_i : in STD_LOGIC;
           add_rom_o : out STD_LOGIC_VECTOR (2 downto 0);
           add_ram_o : out STD_LOGIC_VECTOR (2 downto 0);
           we_ram_o : out STD_LOGIC);
end component;

signal add_rom : STD_LOGIC_VECTOR (2 downto 0) := "000" ;
signal add_ram : STD_LOGIC_VECTOR (2 downto 0) := "000" ;
signal  we_ram : STD_LOGIC := '0' ;

signal data_rom : STD_LOGIC_VECTOR (3 downto 0) := "0000" ;
signal data_ram : STD_LOGIC_VECTOR (3 downto 0) := "0000" ;

begin

unidad_control_map: unidad_control port map  (
                                                clk_i     =>  clk_i,
                                                add_rom_o =>  add_rom,
                                                add_ram_o =>  add_ram,
                                                we_ram_o  =>  we_ram
                                                
                                              );

memoria_ROM: ROM port map (
                            ADD     => add_rom, 
                            DATA    => data_rom,
                            clk     => clk_i
                            );
                            
operacaion_not: operacion port map (
                                    data_i    => data_rom, 
                                    data_o    => data_ram
                                    );

memoria_RAM: RAM port map (
                            add_i     => add_ram, 
                            Data_i    => data_ram,
                            Data_o    => data_o,            
                            WE_i      => we_ram,
                            clk_i     => clk_i
                            );



end Behavioral;
