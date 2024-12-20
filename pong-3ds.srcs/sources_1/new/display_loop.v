`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 04:37:30 AM
// Design Name: 
// Module Name: display_loop
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


module display_loop #(
    parameter D_WIDTH = 640,
    parameter D_HEIGHT = 480,
    parameter PADDLE_WIDTH = 10,
    parameter PADDLE_LENGTH= 150,
    parameter BALL_RAD = 10
    )(
    input clk,
    input rst,
    input [$clog2(D_WIDTH)+1:0] x_coord,
    input [$clog2(D_HEIGHT)+1:0] y_coord,
    input signed[$clog2(D_WIDTH)+1:0] ball_x,
    input signed[$clog2(D_HEIGHT)+1:0] ball_y,
    input signed[$clog2(D_WIDTH)+-1:0] paddle_x,
    input signed[$clog2(D_HEIGHT)+1:0] paddle_y,
    
    output reg[3:0] red_ch_in,
    output reg[3:0] green_ch_in,
    output reg[3:0] blue_ch_in
    );
    localparam BLACK = 0;
    localparam WHITE = 4'b1111;
    always @ *
    begin
        if (x_coord >= ball_x-BALL_RAD && x_coord <= ball_x+BALL_RAD &&
            y_coord >= ball_y-BALL_RAD && y_coord <= ball_y+BALL_RAD)    begin
                red_ch_in = WHITE;
                green_ch_in = BLACK;
                blue_ch_in = BLACK;
        end else if (x_coord >= paddle_x-PADDLE_WIDTH/2 && x_coord <= paddle_x+PADDLE_WIDTH/2 &&
                     y_coord >= paddle_y-PADDLE_LENGTH/2 && y_coord <= paddle_y+PADDLE_LENGTH/2)    begin
                red_ch_in = BLACK;
                green_ch_in = WHITE;
                blue_ch_in = BLACK;
        end else begin
                red_ch_in = BLACK;
                green_ch_in = BLACK;
                blue_ch_in = WHITE;
        end
    end
endmodule
