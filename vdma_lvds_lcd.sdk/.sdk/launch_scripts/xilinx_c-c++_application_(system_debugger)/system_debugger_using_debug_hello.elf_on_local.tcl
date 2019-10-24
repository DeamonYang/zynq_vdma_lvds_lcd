connect -url tcp:127.0.0.1:3121
source H:/FPGA/ZYNQ_PSPL/vdma_lvds_lcd/vdma_lvds_lcd.sdk/lcd_dis_system_top_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS2 201706300081" && level==0} -index 1
fpga -file H:/FPGA/ZYNQ_PSPL/vdma_lvds_lcd/vdma_lvds_lcd.sdk/lcd_dis_system_top_hw_platform_0/lcd_dis_system_top.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
loadhw -hw H:/FPGA/ZYNQ_PSPL/vdma_lvds_lcd/vdma_lvds_lcd.sdk/lcd_dis_system_top_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
dow H:/FPGA/ZYNQ_PSPL/vdma_lvds_lcd/vdma_lvds_lcd.sdk/hello/Debug/hello.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
con
