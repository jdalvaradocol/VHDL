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
    Port ( clk_i     : in  STD_LOGIC;
           reset_i   : in  STD_LOGIC;
           wr_i      : in  STD_LOGIC;
           add_rom_o : out STD_LOGIC_VECTOR (2 downto 0);
           wr_o      : out STD_LOGIC);
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

component decodificador is
    Port ( dato_i    : in STD_LOGIC_VECTOR (7 downto 0);
           sel_ope_o : out STD_LOGIC;
           ope_o     : out STD_LOGIC_VECTOR (1 downto 0);
           des_o     : out STD_LOGIC;
           literal_o : out STD_LOGIC_VECTOR (3 downto 0);
           add_ram_o : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component Operaciones_ALU is
    Port ( ope_i      : in STD_LOGIC_VECTOR (1 downto 0);
           sel_ope_i  : in STD_LOGIC;
           des_i      : in STD_LOGIC;
           Literal_i  : in STD_LOGIC_VECTOR (3 downto 0);
           Registro_i : in STD_LOGIC_VECTOR (3 downto 0);
           wreg_i     : in STD_LOGIC_VECTOR (3 downto 0);
           Dato_o     : out STD_LOGIC_VECTOR (3 downto 0)
          );
end component;

component demux_salida is
    Port ( sel_i : in STD_LOGIC;
           dato_ope_i : in STD_LOGIC_VECTOR (3 downto 0);
           wreg_i : in STD_LOGIC_VECTOR (3 downto 0);
           wreg_o : out STD_LOGIC_VECTOR (3 downto 0);
           registro_o : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component registro_w is
    Port (  clk_i    :  in STD_LOGIC;
            wreg_i : in STD_LOGIC_VECTOR (3 downto 0);
           wreg_alu_o : out STD_LOGIC_VECTOR (3 downto 0);
           wreg_demux_o : out STD_LOGIC_VECTOR (3 downto 0));
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

signal we : std_logic := '0';

signal add_rom : std_logic_vector(2 downto 0):= "000";
signal data_rom : std_logic_vector(7 downto 0):= "00000000";

signal sel_ope     : std_logic := '0';
signal ope         : std_logic_vector(1 downto 0):= "00";
signal des         : std_logic := '0';
signal literal_reg : std_logic_vector(3 downto 0):= "0000";
signal add_ram     : std_logic_vector(1 downto 0):= "00";

signal data_ram_out: std_logic_vector(3 downto 0):= "0000";
signal result      : std_logic_vector(3 downto 0):= "0000";

signal wreg_in     : std_logic_vector(3 downto 0):= "0000";
signal wreg_alu    : std_logic_vector(3 downto 0):= "0000";
signal wreg_demux  : std_logic_vector(3 downto 0):= "0000";

signal data_ram_in: std_logic_vector(3 downto 0):= "0000";

begin

Unidad_control_arq: Unidad_control port map
        (
           clk_i     => clk_i,
           reset_i   => reset_i,
           wr_i      => des,
           add_rom_o => add_rom,
           wr_o      => we
        );

ROM_arq: ROM port map
        (
            ADD     =>  add_rom, 
            DATA    =>  data_rom,
            clk     =>  clk_i
        );
        
 decodificador_arq: decodificador port map
    (
        dato_i    => data_rom,
        sel_ope_o => sel_ope,
        ope_o     => ope,
        des_o     => des,
        literal_o => literal_reg,
        add_ram_o => add_ram   
    );       

operacaiones_ALU_arq: Operaciones_ALU port map
    (
        ope_i      => ope,   
        sel_ope_i  => sel_ope, 
        des_i      => des,  
        Literal_i  => literal_reg,  
        Registro_i => data_ram_out,  
        wreg_i     => wreg_alu,  
        Dato_o     => result  
    );

demux_salida_arq: demux_salida port map
    (
        sel_i       => des,
        dato_ope_i  => result,
        wreg_i      => wreg_demux,
        wreg_o      => wreg_in,
        registro_o  => data_ram_in
    );

registro_w_arq : registro_w port map
    (
        clk_i    => clk_i,
        wreg_i       =>   wreg_in,
        wreg_alu_o   =>   wreg_alu,
        wreg_demux_o =>   wreg_demux
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
wreg_o      <= wreg_in; 
result_o    <= result;
data_ram_o  <= data_ram_out;

end Behavioral;
