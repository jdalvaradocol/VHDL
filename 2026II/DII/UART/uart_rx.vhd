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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_rx is
    generic (
        CLKS_PER_BIT : integer := 1085 -- 125 MHz / 115200 baudios
    );
    port (
        clk       : in  std_logic;
        rx        : in  std_logic;
        rx_done   : out std_logic;                   -- Pulso cuando hay un byte listo
        data_out  : out std_logic_vector(7 downto 0)  -- Byte recibido
    );
end uart_rx;

architecture Behavioral of uart_rx is
    type state_type is (IDLE, RX_START, RX_DATA, RX_STOP);
    signal state : state_type := IDLE;

    signal clk_count : integer range 0 to CLKS_PER_BIT := 0;
    signal bit_index : integer range 0 to 7 := 0;
    signal rx_byte   : std_logic_vector(7 downto 0) := (others => '0');

begin
    process(clk)
    begin
        if rising_edge(clk) then
            case state is
                when IDLE =>
                    rx_done   <= '0';
                    clk_count <= 0;
                    bit_index <= 0;
                    if rx = '0' then -- Bit de inicio detectado
                        state <= RX_START;
                    end if;

                when RX_START =>
                    if clk_count = (CLKS_PER_BIT - 1) / 2 then
                        if rx = '0' then
                            clk_count <= 0;
                            state     <= RX_DATA;
                        else
                            state     <= IDLE;
                        end if;
                    else
                        clk_count <= clk_count + 1;
                    end if;

                when RX_DATA =>
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        rx_byte(bit_index) <= rx;
                        if bit_index < 7 then
                            bit_index <= bit_index + 1;
                        else
                            state <= RX_STOP;
                        end if;
                    end if;

                when RX_STOP =>
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        rx_done   <= '1'; -- Byte listo
                        data_out  <= rx_byte;
                        state     <= IDLE;
                    end if;

                when others =>
                    state <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;
