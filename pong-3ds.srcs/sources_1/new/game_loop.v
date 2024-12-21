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
    parameter BALL_VEL_ABS = 2,
    parameter PADDLE_VEL_ABS = 4,
    parameter WALL_WIDTH = 10,
    parameter PADDLE_WIDTH = 10,
    parameter PADDLE_LENGTH= 150,
    parameter BALL_RAD = 10
    )(
    input clk,
    input rst,
    input frame_start,
    input btn_up,
    input btn_down,
    
    output reg signed[$clog2(D_WIDTH)+1:0] ball_x,
    output reg signed[$clog2(D_HEIGHT)+1:0] ball_y,
    output reg signed[$clog2(D_WIDTH)+1:0] paddle_x,
    output reg signed[$clog2(D_HEIGHT)+1:0] paddle_y
    );
    
    reg signed[$clog2(D_WIDTH)+1:0] ball_x_next;
    reg signed[$clog2(D_HEIGHT)+1:0] ball_y_next;

    // position control 
    localparam BALL_X_START = 320;
    localparam BALL_Y_START = 20;
    
    always @ (posedge clk)
    begin
        if (rst) begin
            ball_x <= BALL_X_START;
            ball_y <= BALL_Y_START;
        end else begin
            ball_x <= ball_x_next;
            ball_y <= ball_y_next;
        end
    end
    
    always @ * 
    begin
        if (frame_start) begin
            ball_x_next = ball_x+x_vel_ball;
            ball_y_next = ball_y+y_vel_ball; 
        end else begin
            ball_x_next = ball_x;
            ball_y_next = ball_y; 
        end
    end
    
    
    // velocity control
    wire signed[$clog2(D_HEIGHT)+1:0] ball_top;
    wire signed[$clog2(D_HEIGHT)+1:0] ball_bottom;
    wire signed[$clog2(D_WIDTH)+1:0] ball_left;
    wire signed[$clog2(D_WIDTH)+1:0] ball_right;
    assign ball_top = ball_y-BALL_RAD;
    assign ball_bottom = ball_y+BALL_RAD;
    assign ball_left = ball_x-BALL_RAD;
    assign ball_right = ball_x+BALL_RAD;

    
    wire upper_hit, lower_hit, top_hit, bottom_hit;
    assign upper_hit = (ball_top <= WALL_WIDTH);
    assign lower_hit = (ball_bottom >= D_HEIGHT-WALL_WIDTH);
    
    // TODO: change with paddle position later
    assign left_hit = (ball_left <= WALL_WIDTH);
    assign right_hit = (ball_right >= D_WIDTH-WALL_WIDTH);
    //////////////////////////////////////// 
    
    reg signed[$clog2(D_WIDTH)+1:0] x_vel_ball;
    reg signed[$clog2(D_HEIGHT)+1:0] y_vel_ball;
    reg signed[$clog2(D_WIDTH)+1:0] x_vel_ball_next;
    reg signed[$clog2(D_HEIGHT)+1:0] y_vel_ball_next;

//  localparam BARRIER_SIZE = WALL_WIDTH + BALL_RAD + 2;
    localparam BALL_VEL_POS = BALL_VEL_ABS;
    localparam BALL_VEL_NEG = -1*BALL_VEL_ABS;
    
    always @ (posedge clk)
    begin
        if (rst) begin
            x_vel_ball <= BALL_VEL_POS;
            y_vel_ball <= BALL_VEL_POS;
        end else begin
            x_vel_ball <= x_vel_ball_next;
            y_vel_ball <= y_vel_ball_next;
        end
    end
    
    always @ * 
    begin
        // catch all
        x_vel_ball_next = x_vel_ball;
        y_vel_ball_next = y_vel_ball; 
        if (frame_start) begin
            // vert direction chech
            if (upper_hit) begin
                y_vel_ball_next = BALL_VEL_POS;
            end else if (lower_hit) begin
                y_vel_ball_next = BALL_VEL_NEG;
            end
            
            // horiz direction check
            if (left_hit) begin
                x_vel_ball_next  = BALL_VEL_POS;
            end else if (right_hit) begin
                x_vel_ball_next = BALL_VEL_NEG;
            end
        end
    end
    // paddle move 
    reg signed[$clog2(D_WIDTH)+1:0] paddle_x_next;
    reg signed[$clog2(D_HEIGHT)+1:0] paddle_y_next;
    
    always @ (posedge clk)
    begin
        if (rst) begin 
            paddle_x <= PADDLE_WIDTH/2;
            paddle_y <= D_HEIGHT/2;
        end else begin
            paddle_x <= paddle_x_next;
            paddle_y <= paddle_y_next;
        end
    end
    
    wire paddle_bottom_hit;
    wire paddle_top_hit;
    
    assign paddle_bottom_hit = (paddle_y > D_HEIGHT-WALL_WIDTH-PADDLE_LENGTH/2);
    assign paddle_top_hit = (paddle_y < WALL_WIDTH+PADDLE_LENGTH/2);
    
    localparam PADDLE_VEL_POS = PADDLE_VEL_ABS;
    localparam PADDLE_VEL_NEG = -1*PADDLE_VEL_ABS;
   ////////////////////***** DEBUGED BELOW *********//////////////////////////
    always @ *
    begin
        // catch all
        paddle_x_next = paddle_x;
        paddle_y_next = paddle_y;
        if (frame_start) begin    
            if (paddle_bottom_hit) begin
                paddle_y_next = D_HEIGHT-WALL_WIDTH-PADDLE_LENGTH/2;
            end else if (paddle_top_hit) begin
                paddle_y_next = WALL_WIDTH+PADDLE_LENGTH/2;
            end else if (btn_down) begin 
                paddle_y_next = paddle_y+PADDLE_VEL_POS;
            end else if (btn_up) begin 
                paddle_y_next = paddle_y+PADDLE_VEL_NEG;
            end
        end        
    end
//
////////////////////////////////////////////////////////////////////////

//    always @ *
//    begin
//        // catch all
//        if (frame_start) begin
//            if (btn_up) begin
//                paddle_y_next = paddle_y+PADDLE_VEL_NEG;
//            end else begin
//                paddle_y_next = paddle_y;
//            end
//        end        
//    end
    
endmodule