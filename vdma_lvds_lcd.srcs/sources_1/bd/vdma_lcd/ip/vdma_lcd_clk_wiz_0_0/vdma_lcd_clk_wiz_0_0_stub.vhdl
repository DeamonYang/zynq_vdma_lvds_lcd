-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed Oct 23 16:13:32 2019
-- Host        : DESKTOP-L1VR7A3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top vdma_lcd_clk_wiz_0_0 -prefix
--               vdma_lcd_clk_wiz_0_0_ vdma_lcd_clk_wiz_0_0_stub.vhdl
-- Design      : vdma_lcd_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vdma_lcd_clk_wiz_0_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_shift_lvds : out STD_LOGIC;
    clk_h_out3 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end vdma_lcd_clk_wiz_0_0;

architecture stub of vdma_lcd_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_shift_lvds,clk_h_out3,resetn,locked,clk_in1";
begin
end;
