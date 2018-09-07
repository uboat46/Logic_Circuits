transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/labLog/practica2/decoder_2_to_4.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/labLog/practica2/cont2.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/labLog/practica2/div_freq.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/labLog/practica2/mux_4_to_1.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/labLog/practica2/bcd_to_7_segment.vhd}

