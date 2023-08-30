----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2021 07:47:21
-- Design Name: 
-- Module Name: MEF_MPAP - Behavioral
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

entity MEF_MPAP is
    Port ( X_i : in STD_LOGIC_VECTOR (1 downto 0);
           clk_i : in STD_LOGIC;
           FF_o : out STD_LOGIC_VECTOR (1 downto 0);
           Y_o : out STD_LOGIC_VECTOR (3 downto 0));
end MEF_MPAP;

architecture Behavioral of MEF_MPAP is

component Reloj is
    Port ( CLK : in  STD_LOGIC;
           CLKDV : out  STD_LOGIC);
end component;

component FFD is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

signal SA : std_logic := '0';
signal SB : std_logic := '0';

signal A : std_logic := '0';
signal B : std_logic := '0';

signal clk_dv : std_logic := '0';

begin

SA <=   (not(A) and not(B) and not(X_i(1)) and X_i(0))  or 
        (not(A) and B and X_i(1) and not(X_i(0)))       or 
        (A and not(X_i(1)) and not(X_i(0)))             or 
        (A and B and X_i(0)) or (A and not(B) and X_i(1)) ;

SB <=   ( B and not(X_i(1)) and not(X_i(0))) or
        ( not(B) and not(X_i(1)) and X_i(0)) or
        ( B and X_i(1) and X_i(0)) or
        ( not(B) and X_i(1) and not(X_i(0))) ;

clk_fre: Reloj port map
        (
            CLK     => clk_i, 
            CLKDV   => clk_dv  
            
        );

MEF0 : FFD port map
        (
            D   =>  SA, 
            clk =>  clk_dv,
            Q   =>  A
        );

MEF1 : FFD port map
        (
            D   =>  SB, 
            clk =>  clk_dv,
            Q   =>  B
        );

Y_o(3) <=       A and       B;
Y_o(2) <=       A and   not(B);
Y_o(1) <=   not(A)and       B;
Y_o(0) <=   not(A)and   not(B);

FF_o(1) <= A;
FF_o(0) <= B;

end Behavioral;
