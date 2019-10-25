// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Thu Oct 24 13:56:19 2019
// Host        : DESKTOP-L1VR7A3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top clk_lvds -prefix
//               clk_lvds_ clk_lvds_stub.v
// Design      : clk_lvds
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_lvds(clk_shift, clk_hs, resetn, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_shift,clk_hs,resetn,locked,clk_in1" */;
  output clk_shift;
  output clk_hs;
  input resetn;
  output locked;
  input clk_in1;
endmodule
