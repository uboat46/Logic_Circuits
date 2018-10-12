transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/decoder_2_to_4.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/cont2.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/div_freq.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/mux_4_to_1.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/bcd_to_7_segment.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/arithmetic_circuit.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/logic_circuit.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/shifter_circuit.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/mux_2_to_1.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/zero_detect.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/practica4/practica4.vhd}

