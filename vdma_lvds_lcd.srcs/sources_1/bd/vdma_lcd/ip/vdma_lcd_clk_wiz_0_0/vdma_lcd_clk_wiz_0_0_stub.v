// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Oct 23 16:13:32 2019
// Host        : DESKTOP-L1VR7A3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top vdma_lcd_clk_wiz_0_0 -prefix
//               vdma_lcd_clk_wiz_0_0_ vdma_lcd_clk_wiz_0_0_stub.v
// Design      : vdma_lcd_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module vdma_lcd_clk_wiz_0_0(clk_out1, clk_shift_lvds, clk_h_out3, resetn, 
  locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_shift_lvds,clk_h_out3,resetn,locked,clk_in1" */;
  output clk_out1;
  output clk_shift_lvds;
  output clk_h_out3;
  input resetn;
  output locked;
  input clk_in1;
endmodule
