----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.09.2021 14:19:59
-- Design Name: 
-- Module Name: display_opc_A - Behavioral
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

entity display_opc_A is
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
end display_opc_A;

architecture Behavioral of display_opc_A is

begin
    g_o <=  (not(B_i) and C_i) or (A_i and not(B_i)) or 
            (not(A_i) and B_i and not(C_i)) or 
            (C_i and not(D_i)) or (A_i and D_i);
    f_o <=  (not(A_i) and B_i and not(C_i)) or 
            (not(C_i) and not(D_i)) or (B_i and not(D_i)) or 
            (A_i and not(B_i)) or (A_i and C_i);
    e_o <=  (not(B_i) and not(D_i))or (C_i and not(D_i)) or 
            (A_i and not(D_i)) or (A_i and C_i);
    d_o <=  (not(A_i) and not(B_i) and not(D_i)) or 
            (not(B_i) and C_i and D_i) or 
            (B_i and not(C_i) and D_i) or 
            (B_i and C_i and not(D_i)) or (A_i and not(C_i));
    c_o <=  (not(B_i) and not(C_i)) or (not(B_i) and D_i) or 
            (not(C_i) and D_i) or (not(A_i) and B_i) or
            (A_i and not(B_i));
    b_o <=  (not(A_i) and not(C_i) and not(D_i)) or 
            (not(A_i) and C_i and D_i) or 
            (A_i and not(C_i) and D_i) or 
            (not(B_i) and not(C_i)) or (not(B_i) and not(D_i));
    a_o <=  (A_i and not(B_i) and not(C_i)) or 
            (not(A_i) and B_i and D_i) or 
            (not(B_i) and not(D_i)) or(not(A_i) and C_i) or 
            (A_i and not(D_i)) or (B_i and C_i);
end Behavioral;
