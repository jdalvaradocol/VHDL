----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2021 14:37:35
-- Design Name: 
-- Module Name: decodificador - Behavioral
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

entity decodificador is
    Port ( data_i       :  in STD_LOGIC_VECTOR (7 downto 0);
           periodo_o    : out STD_LOGIC_VECTOR (27 downto 0);
            duty_o      : out STD_LOGIC_VECTOR (27 downto 0));
end decodificador;

architecture Behavioral of decodificador is

signal  dato_num : integer;

signal      var0 : integer := 0;
signal      var1 : integer := 0;
signal      var2 : integer := 0;
signal      var3 : integer := 0;
signal      var4 : integer := 0;
signal      var5 : integer := 0;
signal      var6 : integer := 0;
signal      var7 : integer := 0;
signal  dato_sum : integer := 1;

signal     dato0 : integer := 0;
signal     dato1 : integer := 0;
signal     dato2 : integer := 0;
signal dato_duty : integer := 50;

signal      duty : integer := 0;
signal   periodo : integer := 0;

begin
   
    dato_num <= to_integer(unsigned(data_i(3 downto 0)));

    var0 <= dato_num            when data_i(7 downto 4) = "0001" else var0;
    var1 <= dato_num*10         when data_i(7 downto 4) = "0010" else var1;
    var2 <= dato_num*100        when data_i(7 downto 4) = "0011" else var2;
    var3 <= dato_num*1000       when data_i(7 downto 4) = "0100" else var3;
    var4 <= dato_num*10000      when data_i(7 downto 4) = "0101" else var4;
    var5 <= dato_num*100000     when data_i(7 downto 4) = "0110" else var5;
    var6 <= dato_num*1000000    when data_i(7 downto 4) = "0111" else var6;
    var7 <= dato_num*10000000   when data_i(7 downto 4) = "1000" else var7;

    dato_sum <= var0 + var1 + var2 + var3 + var4 + var5 + var6 + var7 ; 

    dato0 <= dato_num         when data_i(7 downto 4) = "1011" else dato0;
    dato1 <= dato_num*10      when data_i(7 downto 4) = "1100" else dato1;
    dato2 <= dato_num*100     when data_i(7 downto 4) = "1101" else dato2;

    dato_duty <= dato0 + dato1 + dato2;
    
    periodo <= 125E6 / dato_sum;
    duty    <= (periodo * dato_duty)/100;
    
    periodo_o <=  std_logic_vector(to_unsigned(periodo, periodo_o'length));     
       duty_o <=  std_logic_vector(to_unsigned(   duty,    duty_o'length));     
     
end Behavioral;
