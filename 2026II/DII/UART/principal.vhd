----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.07.2022 10:49:11
-- Design Name: 
-- Module Name: Principal - Behavioral
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

entity top_pynq is
    port (
        clk_i      : in  std_logic;                         -- 125 MHz
        rx_i       : in  std_logic;                         -- Entrada RX serie
        tx_o       : out std_logic;                         -- Salida TX serie
        data_rx_i : in  std_logic_vector(7 downto 0);       -- Entradas DIP Switches
        data_tx_o     : out std_logic_vector(7 downto 0)    -- Salidas LEDs
    );
end top_pynq;

architecture Structural of top_pynq is

    -- Señales internas para interconectar los bloques
    signal rx_done_sig : std_logic;
    signal rx_data_sig : std_logic_vector(7 downto 0);
    signal reg_leds    : std_logic_vector(7 downto 0) := (others => '0');

begin
    -- Asignación de salida a LEDs
    data_tx_o <= reg_leds;

    -- Instancia del Receptor UART
    inst_uart_rx: entity work.uart_rx
        generic map (
            CLKS_PER_BIT => 1085 -- Configurado para 125 MHz / 115200 baudios
        )
        port map (
            clk      => clk_i,
            rx       => rx_i,
            rx_done  => rx_done_sig,
            data_out => rx_data_sig
        );

    -- Instancia del Transmisor UART
    inst_uart_tx: entity work.uart_tx
        generic map (
            CLKS_PER_BIT => 1085
        )
        port map (
            clk      => clk_i,
            tx_start => rx_done_sig, -- Transmite automáticamente cuando termina de recibir un byte
            data_in  => data_rx_i,    -- Envía el valor actual de los Switches hacia la PC
            tx       => tx_o,
            tx_busy  => open
        );

    -- Proceso para retener el valor recibido en los LEDs
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if rx_done_sig = '1' then
                reg_leds <= rx_data_sig; -- Guarda el byte recibido en los LEDs
            end if;
        end if;
    end process;

end Structural;
