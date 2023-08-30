-------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2015 10:24:29 AM
-- Design Name: 
-- Module Name: uart_top
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
--////////////////////////////////////////////////////////////////////////////////

library IEEE;
use IEEE.std_logic_1164.all;

entity uart_top is
	port(
		--Write side inputs
		clk_pin: in std_logic;		              -- Clock input (from pin)
		rst_pin: in std_logic;	   	              -- Active HIGH reset (from pin)
		rxd_pin: in std_logic; 		              -- Uart input
		  pwm_o: out std_logic;                   -- 4 LED outputs
	   led_pins: out std_logic_vector(7 downto 0) -- 4 LED outputs
	);
end;

architecture uart_top_arq of uart_top is

	component uart_led is
		generic(
			BAUD_RATE: integer := 115200;   
			CLOCK_RATE: integer := 50E6
		);
		port(
			-- Write side inputs
			clk_pin:	in std_logic;      					-- Clock input (from pin)
			rst_pin: 	in std_logic;      					-- Active HIGH reset (from pin)
			rxd_pin: 	in std_logic;      					-- RS232 RXD pin - directly from pin
			led_pins: 	out std_logic_vector(7 downto 0)    -- 8 LED outputs
		);
	end component;

component decodificador is
    Port ( data_i       :  in STD_LOGIC_VECTOR (7 downto 0);
           periodo_o    : out STD_LOGIC_VECTOR (27 downto 0);
           duty_o      : out STD_LOGIC_VECTOR (27 downto 0));
end component;

component pwm is
    Port (     clk_i : in STD_LOGIC;
           periodo_i : in STD_LOGIC_VECTOR (27 downto 0);
              duty_i : in STD_LOGIC_VECTOR (27 downto 0);
               pwm_o : out STD_LOGIC);
end component;

signal    data : STD_LOGIC_VECTOR (7 downto 0);
signal periodo : STD_LOGIC_VECTOR (27 downto 0);
signal    duty : STD_LOGIC_VECTOR (27 downto 0);

begin

	U0: uart_led
		generic map(
			BAUD_RATE => 115200,
			CLOCK_RATE => 125E6
		)
		port map(
			clk_pin => clk_pin,  	-- Clock input (from pin)
			rst_pin => rst_pin,  	-- Active HIGH reset (from pin)
			rxd_pin => rxd_pin,  	-- RS232 RXD pin - directly from pin
			led_pins => data 	-- 8 LED outputs
		);
		
	deco : decodificador
	       port map(
	           data_i     =>  data, 
               periodo_o  =>  periodo,
               duty_o    =>  duty
	               );	

	pwm0 : pwm
	       port map(
	           clk_i     => clk_pin,
               periodo_i => periodo,
               duty_i    => duty,
               pwm_o     => pwm_o    
	               );	

led_pins <=  data;
		
end;
