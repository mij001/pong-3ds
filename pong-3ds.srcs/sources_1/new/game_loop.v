`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 05:01:03 AM
// Design Name: 
// Module Name: game_loop
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


module game_loop  #(
    parameter D_WIDTH = 640,
    parameter D_HEIGHT = 480,
    parameter BALL_VEL_ABS = 10,
    parameter PADDLE_VEL_ABS = 10,
    parameter WALL_WIDTH = 20
    )(
    input clk,
    input rst,
    input frame_start,
    input btn_up,
    input btn_down,
    
    output reg signed[$clog2(D_WIDTH):0] ball_x,
    output reg signed[$clog2(D_HEIGHT):0] ball_y,
    output reg signed[$clog2(D_WIDTH)-1:0] paddle_x,
    output reg signed[$clog2(D_HEIGHT)-1:0] paddle_y
    );
    reg signed[$clog2(D_WIDTH):0] ball_x_next;
    reg signed[$clog2(D_HEIGHT):0] ball_y_next;
    reg signed[$clog2(D_WIDTH)-1:0] paddle_x_next;
    reg signed[$clog2(D_HEIGHT):0] paddle_y_next;
    
    reg signed[$clog2(D_WIDTH):0] x_vel_ball;
    reg signed[$clog2(D_HEIGHT):0] y_vel_ball;
    reg signed[$clog2(D_WIDTH):0] x_vel_ball_next;
    reg signed[$clog2(D_HEIGHT):0] y_vel_ball_next;

    
    always @ (posedge clk)
    begin
        if (rst) begin
            ball_x <= 200;
            ball_y <= 200;
            
            x_vel_ball <= BALL_VEL_ABS;
            y_vel_ball <= BALL_VEL_ABS;
            
            paddle_y <= D_HEIGHT/2;
        end else begin
            ball_x <= ball_x_next;
            ball_y <= ball_y_next;
            
            x_vel_ball <= x_vel_ball_next;
            y_vel_ball <= y_vel_ball_next;
            
            paddle_x <= paddle_x_next;
            paddle_y <= paddle_y_next;
        end
    end
    ///////////////
    always @ * begin
        // frame begining indicatior
        // calculations starts at the end of the previous
        // v-sync to give time to comb circuits to settle 
        
        ball_x_next = ball_x;
        ball_y_next = ball_y;
        
        x_vel_ball_next = x_vel_ball;
        y_vel_ball_next = y_vel_ball;
        
        paddle_x_next = WALL_WIDTH+WALL_WIDTH/2;
        paddle_y_next = paddle_y;
        
        if (frame_start) begin
            /////////////////// this can now be considered as a game loop //////////////////
            // reverse ball direction fi hits wall
            // horizontal
            if (ball_x <= WALL_WIDTH || 
                ball_x >= D_WIDTH-WALL_WIDTH) begin 
                x_vel_ball_next=-x_vel_ball;
            end  else begin
                x_vel_ball_next=x_vel_ball;
            end
            // vertical
            if (ball_y <= WALL_WIDTH || 
                ball_y >= D_HEIGHT-WALL_WIDTH) begin 
                y_vel_ball_next=-y_vel_ball;
            end  else begin
                y_vel_ball_next=y_vel_ball;
            end
            
            // update position of the ball
            ball_x_next = ball_x+x_vel_ball;
            ball_y_next = ball_x+y_vel_ball;
            ////////////////////////////////////////////////////////////////////////////////
        end else begin
            ball_x_next = ball_x;
            ball_y_next = ball_y;
            
            x_vel_ball_next = x_vel_ball;
            y_vel_ball_next = y_vel_ball;
            
            paddle_x_next = WALL_WIDTH+WALL_WIDTH/2;
            paddle_y_next = paddle_y;
        end
    end
endmodule
