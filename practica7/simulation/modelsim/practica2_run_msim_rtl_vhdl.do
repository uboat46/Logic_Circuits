transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/decoder_2_to_4.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/cont2.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/div_freq.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/mux_4_to_1.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/bcd_to_7_segment.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/arithmetic_circuit.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/logic_circuit.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/shifter_circuit.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/mux_2_to_1.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/zero_detect.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/practica4.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/registry_file.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/ram.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/branch_control.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/zero_fill.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/extend.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/program_counter.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/instruction_decoder.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/instruction_memory.vhd}
vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/final/Logic_Circuits/practica7/practica_final.vhd}

