----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2021 07:56:11
-- Design Name: 
-- Module Name: arquitectura - Behavioral
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

entity arquitectura is
    Port ( clk_i        : in STD_LOGIC;
           reset_i      : in STD_LOGIC;
           data_rom_o   : out STD_LOGIC_VECTOR (7 downto 0);
           result_o     : out STD_LOGIC_VECTOR (3 downto 0);
           wreg_o       : out STD_LOGIC_VECTOR (3 downto 0);
           data_ram_o   : out STD_LOGIC_VECTOR (3 downto 0));
end arquitectura;

architecture Behavioral of arquitectura is

component Unidad_control is
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
end component;

component ROM is
    generic
    (
        Data_width : natural := 8;
        Add_width  : natural := 3
    );
    
    Port ( ADD : in STD_LOGIC_VECTOR ((Add_width-1) downto 0);
           DATA : out STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           clk : in STD_LOGIC);
end component;

component Operaciones_ALU is
    Port ( ope_i      : in STD_LOGIC_VECTOR (1 downto 0);
           sel_ope_i  : in STD_LOGIC;
           dato_ALU_i : in STD_LOGIC_VECTOR (3 downto 0);
           wreg_i     : in STD_LOGIC_VECTOR (3 downto 0);
           Dato_o     : out STD_LOGIC_VECTOR (3 downto 0)
          );
end component;

component registro_w is
    Port (  clk_i       : in STD_LOGIC;
            wreg_i      : in STD_LOGIC_VECTOR (3 downto 0);
            wreg_o  : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RAM is
    generic
    (
        Data_width : natural := 4;
        Add_width  : natural := 2 
    );
    Port ( add_i    :  in STD_LOGIC_VECTOR ((Add_width-1) downto 0);
           Data_i   :  in STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           Data_o   :  out STD_LOGIC_VECTOR ((Data_width-1) downto 0);
           we_i     :  in STD_LOGIC;
           clk_i    :  in STD_LOGIC
           );
end component;


signal add_rom : std_logic_vector(2 downto 0):= "000";
signal data_rom : std_logic_vector(7 downto 0):= "00000000";

signal we           : std_logic := '0';
signal add_ram      : std_logic_vector(1 downto 0):= "00";
signal data_ram_in  : std_logic_vector(3 downto 0):= "0000";
signal data_ram_out : std_logic_vector(3 downto 0):= "0000";

signal sel_ope     : std_logic := '0';
signal operacion   : std_logic_vector(1 downto 0):= "00";
signal data_alu    : std_logic_vector(3 downto 0):= "0000";

signal result      : std_logic_vector(3 downto 0):= "0000";

signal wreg_in     : std_logic_vector(3 downto 0):= "0000";
signal wreg_out    : std_logic_vector(3 downto 0):= "0000";


begin

Unidad_control_arq: Unidad_control port map
        (
           clk_i        => clk_i,
           reset_i      => reset_i,
           data_alu_i   => result,
           data_ram_i   => data_ram_out,
           data_rom_i   => data_rom,
           wreg_i       => wreg_out,    
           operacaion_o => operacion,
           dato_ALU_o   => data_alu,
           wreg_o       => wreg_in,
           add_rom_o    => add_rom,
           data_ram_o   => data_ram_in,
           add_ram_o    => add_ram,
           wr_o         => we
        );

Rom_arq: ROM port map
        (
            ADD     =>  add_rom, 
            DATA    =>  data_rom,
            clk     =>  clk_i
        );
        
      

operacaiones_ALU_arq: Operaciones_ALU port map
    (
        ope_i      => operacion,   
        sel_ope_i  => we,
        dato_ALU_i => data_alu, 
        wreg_i     => wreg_out,  
        Dato_o     => result  
    );

registro_w_arq : registro_w port map
    (
        clk_i    =>   clk_i,
        wreg_i   =>   wreg_in,
        wreg_o   =>   wreg_out
    ); 

Ram_arq : RAM port map 
    (
        add_i    => add_ram,
        Data_i   => data_ram_in,
        Data_o   => data_ram_out,
        we_i     => we,
        clk_i    => clk_i
    );

data_rom_o  <= data_rom;
wreg_o      <= wreg_out; 
result_o    <= result;
data_ram_o  <= data_ram_out;

end Behavioral;
