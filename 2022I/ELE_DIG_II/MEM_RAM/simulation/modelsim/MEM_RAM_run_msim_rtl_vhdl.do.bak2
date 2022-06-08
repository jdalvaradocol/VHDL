transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/josed/OneDrive - Universidad de Cundinamarca/Programacion/Quartus/DE1/MEM_RAM/MEM_RAM.vhd}

vcom -93 -work work {C:/Users/josed/OneDrive - Universidad de Cundinamarca/Programacion/Quartus/DE1/MEM_RAM/MEM_RAM_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  MEM_RAM_tb

add wave *
view structure
view signals
run -all
