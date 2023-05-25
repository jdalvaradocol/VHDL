----------------------------------------------------------------------------------
-- Company:             
-- Engineer:        Jose David Alvarado
-- 
-- Create Date:     30.07.2022 10:49:11
-- Design Name:     uart_rx
-- Module Name:     uart_rx - Behavioral
-- Project Name:    UART 
-- Target Devices:  PYNQ_Z2 
-- Tool Versions:   Vivado v2020 1.1
-- Description:     Lectura de la Comunicacion serial 
--                  F = 125M, Baud_rate = 9600, Numero de bits = 8, 
--                  Paridad = None, Stop Bits = 0. Flow control = None  
-- Dependencies:    
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx is
	generic(
		DBIT      : integer :=     8; -- number data bits
		CLK_FREQ  : integer := 125e6;  --frequency of system clock in Hertz
		BAUD_RATE : integer :=  9600 -- data link baud rate in bits/second
	);
	port(
		clk_i, reset_i  : in std_logic;
		rx_i            : in std_logic;
	    valid_o         : out std_logic;
		dout_o          : out std_logic_vector(7 downto 0)
	) ;
end uart_rx;

architecture arch of uart_rx is

type state_type is (idle, star, data);
signal  state_reg  : state_type:=idle;
signal  data_reg   : std_logic_vector(7 downto 0);
signal  data_FA   : std_logic_vector(7 downto 0);
signal  data_FB   : std_logic_vector(7 downto 0);
signal  data_FC   : std_logic_vector(7 downto 0);
signal  data_FD   : std_logic_vector(7 downto 0);

signal  count_bits : integer range 0 to DBIT :=0;
signal  count_os   : integer range 0 to  clk_freq/(baud_rate-1) + (clk_freq/(baud_rate-1))/2 := 0;

signal valid  : std_logic:= '0';
signal inicio : std_logic:= '0';

begin
    
    -- Señales de Baud_rate
	process(clk_i)
    begin
    
        if rising_edge(clk_i) then 
               
            if reset_i = '1' then
		      state_reg <= idle;
              count_os   <= 0;
		      count_bits <= 0;
		      data_reg   <= (others => '0');
	       elsif state_reg = idle then	      
		      count_os   <= 0;
		      count_bits <= 0;
              data_reg   <= (others => '0');
              
              if inicio = '1' then
                state_reg <= star;
              end if;
              		      
           elsif state_reg = star then
                 
                if  count_os < 100 then
                    valid    <= '1';     
                    count_os <= count_os + 1;
	            elsif count_os < ((clk_freq/(baud_rate-1)+(clk_freq/(baud_rate-1))/2))-1 then
	               count_os  <= count_os + 1; 
                   valid     <= '0';     
                else 
	               valid     <= '1';
	               count_os  <= 0;
	               data_reg <= rx_i & data_reg(7 downto 1);
                   count_bits <= count_bits + 1;
                   state_reg <= data;
	           end if;     
           elsif state_reg = data then          
                if  count_os < 100 then
                    valid    <= '1';     
                    count_os <= count_os + 1;
                elsif count_os < (clk_freq/(baud_rate-1))-1 then
                    count_os <= count_os + 1;
                    valid    <= '0';     
                else
                    valid    <= '1';
                    count_os <= 0;
                    data_reg <= rx_i & data_reg(7 downto 1);
                    count_bits <= count_bits + 1;
                end if;
                -- Se cargan los datos en la señal de salida.
                if  count_bits = 8 then
                    state_reg <= idle;
                    data_FA  <= data_reg ;
                    data_FB  <= data_FA ;
                    data_FC  <= data_FB ;
                    data_FD  <= data_FC ;
                    dout_o  <= data_FA and data_FB and data_FC and data_FD;
                    
                    -- dout_o <= data_reg ; -- Activar esta linea para cuando se envian datos diferentes.
                    
               end if;
           else
                state_reg <= idle;        
		   end if;		      
         end if;
    end process;
    
	-- Lectura del bit de inicio
	process(state_reg, reset_i, rx_i)
	begin
	    if reset_i = '1' then
		  inicio <= '0';
		elsif state_reg = idle then
          	if falling_edge(rx_i) then 
                inicio <= '1';        
            end if;
        else 
            inicio <= '0';
		end if;
	end process;
valid_o <= valid;
end arch;