// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Oct 23 16:13:32 2019
// Host        : DESKTOP-L1VR7A3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top vdma_lcd_xlconstant_0_1 -prefix
//               vdma_lcd_xlconstant_0_1_ vdma_lcd_xlconstant_0_1_stub.v
// Design      : vdma_lcd_xlconstant_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlconstant_v1_1_5_xlconstant,Vivado 2018.2" *)
module vdma_lcd_xlconstant_0_1(dout)
/* synthesis syn_black_box black_box_pad_pin="dout[0:0]" */;
  output [0:0]dout;
endmodule
