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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Principal is
    Port ( 
            clk_i        : in STD_LOGIC;
            reset_i      : in STD_LOGIC;
            data_rx_i    : in STD_LOGIC_VECTOR (7 downto 0);
            rx_i         : in STD_LOGIC;
				clk_o        : out STD_LOGIC;
            tx_o         : out STD_LOGIC;
            data_tx_o    : out STD_LOGIC_VECTOR (7 downto 0)
          );
end Principal;

architecture Behavioral of Principal is

signal rx_error : std_logic := '0';
signal rx_busy  : std_logic := '0'; 
signal tx_busy  : std_logic := '0'; 
signal tx_ena   : std_logic := '0';
signal reset    : std_logic := '0';
signal clk    : std_logic := '0';

signal data_rx  : STD_LOGIC_VECTOR (7 downto 0);
signal data_tx  : STD_LOGIC_VECTOR (7 downto 0);

begin
        
        UART_RX: entity work.uart_rx
        generic map 
        (
            DBIT   =>         8,  -- data bus width
            BAUD_RATE =>      9600,  -- data link baud rate in bits/second
            CLK_FREQ  => 50e6  -- frequency of system clock in Hertz
        )
        port map
        (
             clk_i =>   clk_i,      -- system clock
           reset_i => reset_i,      -- ascynchronous reset
              rx_i =>    rx_i,      -- receive pin
           valid_o =>   clk_o,
            dout_o => data_tx_o     -- data received
        );

tx_o <=    rx_i;
    
end Behavioral;
