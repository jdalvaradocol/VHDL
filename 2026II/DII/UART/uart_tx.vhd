----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.08.2025 16:00:42
-- Design Name: 
-- Module Name: uart_tx - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity uart_tx is
    generic (
        CLKS_PER_BIT : integer := 1085 -- 125 MHz / 115200 baudios
    );
    port (
        clk      : in  std_logic;
        tx_start : in  std_logic;                    -- Pulso para iniciar envío
        data_in  : in  std_logic_vector(7 downto 0); -- Byte a enviar
        tx       : out std_logic;                    -- Pin físico TX
        tx_busy  : out std_logic                     -- Indica si está transmitiendo
    );
end uart_tx;

architecture Behavioral of uart_tx is
    -- Se usan prefijos S_ para los estados para evitar colisión de nombres con los puertos
    type state_type is (S_IDLE, S_TX_START, S_TX_DATA, S_TX_STOP);
    signal state : state_type := S_IDLE;

    signal clk_count : integer range 0 to CLKS_PER_BIT := 0;
    signal bit_index : integer range 0 to 7 := 0;
    signal tx_byte   : std_logic_vector(7 downto 0) := (others => '0');

begin
    process(clk)
    begin
        if rising_edge(clk) then
            case state is
                when S_IDLE =>
                    tx      <= '1';
                    tx_busy <= '0';
                    clk_count <= 0;
                    bit_index <= 0;
                    if tx_start = '1' then
                        tx_byte <= data_in;
                        tx_busy <= '1';
                        state   <= S_TX_START;
                    end if;

                when S_TX_START =>
                    tx <= '0'; -- Bit de inicio
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        state     <= S_TX_DATA;
                    end if;

                when S_TX_DATA =>
                    tx <= tx_byte(bit_index);
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        if bit_index < 7 then
                            bit_index <= bit_index + 1;
                        else
                            state <= S_TX_STOP;
                        end if;
                    end if;

                when S_TX_STOP =>
                    tx <= '1'; -- Bit de parada
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        tx_busy   <= '0';
                        state     <= S_IDLE;
                    end if;

                when others =>
                    state <= S_IDLE;
            end case;
        end if;
    end process;
end Behavioral;