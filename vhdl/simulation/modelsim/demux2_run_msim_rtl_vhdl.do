transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/shivi/Documents/Sem5/EE309_Microprocessors/Micro_Project/Updated micro/demux2.vhd}

