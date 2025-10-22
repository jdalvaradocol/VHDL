-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx is
    generic (
        OVERSAMPLE : integer := 16
    );
    port (
        clk_overbaud_i : in  std_logic;                       -- Reloj sobremuestreo
        reset_i        : in  std_logic;                       -- Reset síncrono activo en '0'
        rx_i           : in  std_logic;                       -- Línea RX UART
        data_o         : out std_logic_vector(7 downto 0)     -- Byte recibido
    );
end uart_rx;

architecture Behavioral of uart_rx is

    -- Constantes de tiempos de muestreo
    constant TICK_INICIO : integer := (OVERSAMPLE / 2) - 1;
    constant TICK_DATA   : integer := OVERSAMPLE - 1;

    -- Estados
    type state_t is (IDLE, INICIO, DATA, STOP);
    signal estado         : state_t := IDLE;

    signal bit_index      : integer range 0 to 7 := 0;
    signal counter_sample : integer range 0 to TICK_INICIO := 0;
    signal rx_sync, rx_prev : std_logic := '1';
    signal data_reg       : std_logic_vector(7 downto 0) := (others => '0');

begin

    process(clk_overbaud_i)
    begin
        if rising_edge(clk_overbaud_i) then

            -- Sincronización de rx_i
            rx_prev <= rx_sync;
            rx_sync <= rx_i;

            -- Reset síncrono
            if reset_i = '0' then
                estado         <= IDLE;
                bit_index      <= 0;
                counter_sample <= 0;
                data_reg       <= (others => '0');

            -- Estado IDLE: espera flanco de bajada
            elsif estado = IDLE then
                counter_sample <= 0;
                bit_index <= 0;
                if (rx_prev = '1' and rx_sync = '0') then
                    estado <= INICIO;
                end if;

            -- Estado INICIO: espera mitad del bit de inicio
            elsif estado = INICIO then
                if counter_sample = TICK_INICIO then
                    counter_sample <= 0;
                    estado <= DATA;
                else
                    counter_sample <= counter_sample + 1;
                end if;

            -- Estado DATA: recibe bits
            elsif estado = DATA then
                if counter_sample = TICK_DATA then
                    data_reg(bit_index) <= rx_sync;
                    counter_sample <= 0;
                    if bit_index = 7 then
                        estado <= STOP;
                    else
                        bit_index <= bit_index + 1;
                    end if;
                else
                    counter_sample <= counter_sample + 1;
                end if;

            -- Estado STOP: espera bit de parada
            elsif estado = STOP then
                if counter_sample = TICK_DATA then
                    estado <= IDLE;
                    counter_sample <= 0;
                else
                    counter_sample <= counter_sample + 1;
                end if;
            end if;

        end if;
    end process;

    data_o <= data_reg;

end Behavioral;

