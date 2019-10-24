`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/22 21:25:16
// Design Name: 
// Module Name: blinblin_led
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


module blinblin_led(
    input   logic   rst_n_i,
    input   logic   clk_i,
    output  logic   led
    );
    
    logic[25:0]cnt;
    
    always_ff@(posedge clk_i or negedge rst_n_i)
    if(!rst_n_i)
        cnt <= 'd0;
    else if(cnt < 25'd25_000_000)
        cnt <= cnt + 1'b1;
    else
        cnt <= 'd0;
    always_ff@(posedge clk_i or negedge rst_n_i)
    if(!rst_n_i)
        led <= 1'b0;
    else if(cnt == 'd1)
        led <= ~led;
 //   assign led = cnt[22];
endmodule
