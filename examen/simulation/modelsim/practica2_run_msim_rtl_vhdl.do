transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/local/ITAM/esotomayg/Documents/Logic_Circuits/examen/par_impar_ex3.vhd}

