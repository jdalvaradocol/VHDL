set_property PACKAGE_PIN R14 [get_ports {led_pins[3]}]
set_property PACKAGE_PIN P14 [get_ports {led_pins[2]}]
set_property PACKAGE_PIN N16 [get_ports {led_pins[1]}]
set_property PACKAGE_PIN M14 [get_ports {led_pins[0]}]
set_property PACKAGE_PIN H16 [get_ports clk_pin]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports clk_pin]
set_property IOSTANDARD LVCMOS33 [get_ports rst_pin]
set_property IOSTANDARD LVCMOS33 [get_ports rxd_pin]
set_property PACKAGE_PIN D20 [get_ports rst_pin]
set_property PACKAGE_PIN W18 [get_ports rxd_pin]

set_property PACKAGE_PIN G17 [get_ports {led_pins[4]}]
set_property PACKAGE_PIN L14 [get_ports {led_pins[5]}]
set_property PACKAGE_PIN L15 [get_ports {led_pins[6]}]
set_property PACKAGE_PIN G14 [get_ports {led_pins[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[4]}]

create_clock -period 8.000 -name clk_pin -waveform {0.000 4.000} -add [get_ports clk_pin]


set_property PACKAGE_PIN W19 [get_ports pwm_o]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_o]