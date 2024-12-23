`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 08:46:33 PM
// Design Name: 
// Module Name: top
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
//  test nedded to run (leave empty if none)
`define SCREEN_TESTn

module pong3ds #(
    parameter H_ACTIVE_REGION = 640,
    parameter H_FRONT_PORCH = 16,
    parameter H_SYNC_PULSE = 96,
    parameter H_BACK_PORCH = 48,
    
    parameter V_ACTIVE_REGION = 480, 
    parameter V_FRONT_PORCH = 10,
    parameter V_SYNC_PULSE = 2,
    parameter V_BACK_PORCH = 33
    )(
    input clk,
    input rst,
    input btn_up,
    input btn_down,
    input start_btn,

    output wire h_sync,
    output wire v_sync,
    output wire [3:0] red_ch,
    output wire [3:0] green_ch,
    output wire [3:0] blue_ch
    
    //////////////////test 
    , output reg led_rr
    );
    
    // clock devider - pixel_clk
    wire tim_25mhz;
    tim_25mhz_en clk_dev_mdl (.clk(clk), .rst(rst), .tim_25mhz(tim_25mhz));

    // vga
    wire[$clog2(H_ACTIVE_REGION)-1:0] x_coord;
    wire[$clog2(V_ACTIVE_REGION)-1:0] y_coord;
    wire frame_start;

`ifdef SCREEN_TEST
    // for screen testing channels are driven manually
    reg[3:0] red_ch_in;
    reg[3:0] green_ch_in;
    reg[3:0] blue_ch_in;
`else
    wire[3:0] red_ch_in;
    wire[3:0] green_ch_in;
    wire[3:0] blue_ch_in;
`endif
    

    
    vga display_vga(
                    .clk(clk), 
                    .rst(rst),
                    .tim_25mhz(tim_25mhz),
                    .red_ch_in(red_ch_in),
                    .green_ch_in(green_ch_in),
                    .blue_ch_in(blue_ch_in),
                    .x_coord(x_coord),
                    .y_coord(y_coord),
                    .frame_start(frame_start),
                    
                    .h_sync(h_sync),
                    .v_sync(v_sync),
                    .red_ch_out(red_ch),
                    .green_ch_out(green_ch),
                    .blue_ch_out(blue_ch)
                    );
                    
    ///////// 640 x 480 display ///////////
    localparam BLACK = 0;
    localparam WHITE = 4'b1111;

/********* screen test *********/
`ifdef SCREEN_TEST
    always @ * 
    begin
        red_ch_in = BLACK;
        green_ch_in = BLACK;
        blue_ch_in = BLACK;
        // 640 x 480 display 
        if (x_coord >= 10 && x_coord <= 50 && y_coord >= 10 && y_coord <= 50) begin
            red_ch_in = WHITE;
            green_ch_in = BLACK;
            blue_ch_in = BLACK;
        end else begin
            red_ch_in = BLACK;
            green_ch_in = WHITE;
            blue_ch_in = BLACK;
        end
    end  
`endif
/*******************************/

    wire[$clog2(H_ACTIVE_REGION)-1:0] ball_x;
    wire[$clog2(H_ACTIVE_REGION)-1:0] ball_y;
    wire[$clog2(H_ACTIVE_REGION)-1:0] paddle_x;
    wire[$clog2(H_ACTIVE_REGION)-1:0] paddle_y;
/*********** ball test *********/
`ifdef BALL_TEST
    localparam PADDLE_WIDTH = 10;
    localparam PADDLE_LENGTH= 150;
    localparam BALL_RAD = 10;
    assign ball_x = BALL_RAD*4;
    assign ball_y = BALL_RAD*4;
    assign paddle_x = PADDLE_WIDTH*4;
    assign paddle_y = V_ACTIVE_REGION/2;
`else
/*******************************/
    /////// update game loop  /////////
    game_loop game (
                   .clk(clk),
                   .rst(rst),
                   .frame_start(frame_start),
                   .ball_x(ball_x),
                   .ball_y(ball_y),
                   .paddle_x(paddle_x),
                   .paddle_y(paddle_y),
                   .btn_up(btn_up),
                   .btn_down(btn_down),
                   .start_btn(start_btn)
    );
   //////////////////////////////////////       

`endif
`ifndef SCREEN_TEST
    display_loop blitter (
                       .clk(clk),
                       .rst(rst),
                       .x_coord(x_coord),
                       .y_coord(y_coord),
                       .ball_x(ball_x),
                       .ball_y(ball_y),
                       .paddle_x(paddle_x),
                       .paddle_y(paddle_y),
                   
                       .red_ch_in(red_ch_in),
                       .green_ch_in(green_ch_in),
                       .blue_ch_in(blue_ch_in)
    ); 
`endif    
endmodule
