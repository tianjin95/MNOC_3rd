transcript on
if ![file isdirectory MNOC_3rd_iputf_libs] {
	file mkdir MNOC_3rd_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vcom "D:/Study/Graduation_Project/verilog/MNOC_3rd/source/clock_management/super_pll_sim/super_pll.vho"

vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/stimulation {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/stimulation/regular_sensor_counter.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/stimulation {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/stimulation/random_16bit.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/stimulation {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/stimulation/random_8bit.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/stimulation {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/stimulation/priority_sensor_counter.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_UART_NI {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_UART_NI/router_UART_NI.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI/router_sensor_NI.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI/regularNI_FIFO_wrctrl.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI/regular_sensor_interface.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI/priorityNI_FIFO_wrctrl.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI/priority_sensor_interface.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/router_sensor_NI/clock_division.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module/two_1_mux.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module/three_1_mux.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module/FIFO_readctrl.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module/FIFO.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/public_module/FIFO _32depth.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i3_router {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i3_router/i3_router_FIFO_wrctrl.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i3_router {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i3_router/i3_router.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i2_router {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i2_router/i2_router_FIFO_wrctrl.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i2_router {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i2_router/i2_router.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i1_router {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i1_router/i1_router_FIFO_wrctrl.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i1_router {D:/Study/Graduation_Project/verilog/MNOC_3rd/source/i1_router/i1_router.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd {D:/Study/Graduation_Project/verilog/MNOC_3rd/MNOC_3rd.v}
vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd {D:/Study/Graduation_Project/verilog/MNOC_3rd/baseline_c5gx.v}

vlog -vlog01compat -work work +incdir+D:/Study/Graduation_Project/verilog/MNOC_3rd/simulation/modelsim {D:/Study/Graduation_Project/verilog/MNOC_3rd/simulation/modelsim/MNOC_3rd.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  MNOC_3rd_vlg_tst

add wave *
view structure
view signals
run -all
