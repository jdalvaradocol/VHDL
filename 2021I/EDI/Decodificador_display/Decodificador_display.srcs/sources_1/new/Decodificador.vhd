----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.09.2021 15:19:54
-- Design Name: 
-- Module Name: Decodificador - Behavioral
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

entity Decodificador is
    Port ( entrada : in STD_LOGIC_VECTOR (3 downto 0);
           salida_A : out STD_LOGIC_VECTOR (6 downto 0);
           salida_B : out STD_LOGIC_VECTOR (6 downto 0);
           salida_C : out STD_LOGIC_VECTOR (6 downto 0);
           salida_D : out STD_LOGIC_VECTOR (6 downto 0));
end Decodificador;

architecture Behavioral of Decodificador is

component display_opc_A is
 Port (     
        A_i  : in STD_LOGIC;
        B_i  : in STD_LOGIC;
        C_i  : in STD_LOGIC;
        D_i  :  in STD_LOGIC;
        a_o  : out STD_LOGIC;
        b_o  : out STD_LOGIC;
        c_o  : out STD_LOGIC;
        d_o : out STD_LOGIC;
        e_o : out STD_LOGIC;
        f_o : out STD_LOGIC;
        g_o : out STD_LOGIC
       );
end component;

component display_opc_B is
    Port ( bin_i : in STD_LOGIC_VECTOR (3 downto 0);
           dis_o : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component display_opc_C is
    Port ( bin_i : in STD_LOGIC_VECTOR (3 downto 0);
           dis_o : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component display_opc_D is
    Port ( bin_i : in STD_LOGIC_VECTOR (3 downto 0);
           dis_o : out STD_LOGIC_VECTOR (6 downto 0));
end component;

begin

display_A: display_opc_A port map(
                                    A_i  => entrada(3),
                                    B_i  => entrada(2),
                                    C_i  => entrada(1),
                                    D_i  => entrada(0),
                                    a_o  => salida_A(0),
                                    b_o  => salida_A(1),
                                    c_o  => salida_A(2),
                                    d_o  => salida_A(3),
                                    e_o  => salida_A(4),
                                    f_o  => salida_A(5),
                                    g_o  => salida_A(6)
                                    );

display_B: display_opc_B port map(
                                    bin_i => entrada,
                                    dis_o => salida_B 
                                    );

display_C: display_opc_C port map(
                                    bin_i => entrada,
                                    dis_o => salida_C 
                                    );
                                    
 display_D: display_opc_D port map(
                                    bin_i => entrada,
                                    dis_o => salida_D 
                                    );                                   



end Behavioral;
