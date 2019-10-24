`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/23 16:24:10
// Design Name: 
// Module Name: lcd_dis_system_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lcd_dis_system_top(
	inout	[14:0]		DDR_addr,
	inout	[2:0]		DDR_ba,
	inout				DDR_cas_n,
	inout				DDR_ck_n,
	inout				DDR_ck_p,
	inout				DDR_cke,
	inout				DDR_cs_n,
	inout 	[3:0]		DDR_dm,
	inout 	[31:0]		DDR_dq,
	inout 	[3:0]		DDR_dqs_n,
	inout 	[3:0]		DDR_dqs_p,
	inout 				DDR_odt,
	inout 				DDR_ras_n,
	inout 				DDR_reset_n,
	inout 				DDR_we_n,
	inout 				FIXED_IO_ddr_vrn,
	inout 				FIXED_IO_ddr_vrp,
	inout 	[53:0]		FIXED_IO_mio,
	inout 				FIXED_IO_ps_clk,
	inout 				FIXED_IO_ps_porb,
	inout 				FIXED_IO_ps_srstb,
	output	[3:0]		lvds_data_p_o,
	output	[3:0]		lvds_data_n_o,	
	output				lvds_clk_p_o,
	output				lvds_clk_n_o,
	output              led_o
    );
	
		
	localparam DATA_IN_LEN = 8;
	localparam LVDS_LANES = 4;
	
	logic 			clk_h_out3;
	logic 			clk_shift_lvds;
	logic 			[23:0]lcd_data;
	logic 			lcd_de;
	logic 			lcd_hs;
	logic 			lcd_vs;
	logic 			sys_rst_n;

	
	
	vdma_lcd_wrapper zynq_sys(
		.DDR_addr			(DDR_addr			),
		.DDR_ba				(DDR_ba				),
		.DDR_cas_n			(DDR_cas_n			),
		.DDR_ck_n			(DDR_ck_n			),
		.DDR_ck_p			(DDR_ck_p			),
		.DDR_cke			(DDR_cke			),
		.DDR_cs_n			(DDR_cs_n			),
		.DDR_dm				(DDR_dm				),
		.DDR_dq				(DDR_dq				),
		.DDR_dqs_n			(DDR_dqs_n			),
		.DDR_dqs_p			(DDR_dqs_p			),
		.DDR_odt			(DDR_odt			),
		.DDR_ras_n			(DDR_ras_n			),
		.DDR_reset_n		(DDR_reset_n		),
		.DDR_we_n			(DDR_we_n			),
		.FIXED_IO_ddr_vrn	(FIXED_IO_ddr_vrn	),
		.FIXED_IO_ddr_vrp	(FIXED_IO_ddr_vrp	),
		.FIXED_IO_mio		(FIXED_IO_mio		),
		.FIXED_IO_ps_clk	(FIXED_IO_ps_clk	),
		.FIXED_IO_ps_porb	(FIXED_IO_ps_porb	),
		.FIXED_IO_ps_srstb	(FIXED_IO_ps_srstb	),
		.clk_h_out3			(clk_h_out3			),
		.clk_shift_lvds		(clk_shift_lvds		),
		.lcd_data			(lcd_data			),
		.lcd_de				(lcd_de				),
		.lcd_hs				(lcd_hs				),
		.lcd_vs				(lcd_vs				),
		.sys_rst_n			(sys_rst_n			));
		
	lcd_lvds#(
		.DATA_IN_LEN	(DATA_IN_LEN	) ,
		.LVDS_LANES		(LVDS_LANES		)
	)lvds_ins_u0(
		.rst_n_i		(sys_rst_n		),
		.clk_i			(clk_h_out3		),
		.clk_p_i		(clk_shift_lvds	),
		.clk_n_i		(1'b1			),
		.clk_dvi_i		(clk_shift_lvds	),
		.lcd_de_i		(lcd_de			),
		.lcd_vs_i		(lcd_vs			),
		.lcd_hs_i		(lcd_hs			),
//		.lcd_r_i		(lcd_data[23:16]),
		.lcd_r_i		(8'hAA          ),
		.lcd_g_i		(lcd_data[15:8]	),
		.lcd_b_i		(lcd_data[7:0]	),
		.lvds_data_p_o	(lvds_data_p_o	),
		.lvds_data_n_o	(lvds_data_n_o	),
		.lvds_clk_p_o	(lvds_clk_p_o	),
		.lvds_clk_n_o	(lvds_clk_n_o	)
	);	
	
	 blinblin_led led_ins(
		.rst_n_i	(sys_rst_n),
		.clk_i		(clk_shift_lvds),
		.led		(led_o)
       );
//	assign led_o = ~clk_shift_lvds;
	
endmodule






















