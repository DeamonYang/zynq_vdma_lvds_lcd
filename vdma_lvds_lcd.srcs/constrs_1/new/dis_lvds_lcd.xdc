set_property IOSTANDARD DIFF_HSTL_I [get_ports lvds_clk_p_o]
set_property IOSTANDARD DIFF_HSTL_I [get_ports {lvds_data_p_o[0]}]
set_property IOSTANDARD DIFF_HSTL_I [get_ports {lvds_data_p_o[1]}]
set_property IOSTANDARD DIFF_HSTL_I [get_ports {lvds_data_p_o[2]}]
set_property IOSTANDARD DIFF_HSTL_I [get_ports {lvds_data_p_o[3]}]

set_property PACKAGE_PIN M15 [get_ports led_o]
set_property IOSTANDARD LVCMOS33 [get_ports led_o]

set_property PACKAGE_PIN N18 [get_ports {lvds_data_p_o[0]}]
set_property PACKAGE_PIN T20 [get_ports {lvds_data_p_o[2]}]
set_property PACKAGE_PIN T14 [get_ports lvds_clk_p_o]
set_property PACKAGE_PIN N20 [get_ports {lvds_data_p_o[1]}]
set_property PACKAGE_PIN T16 [get_ports {lvds_data_p_o[3]}]
