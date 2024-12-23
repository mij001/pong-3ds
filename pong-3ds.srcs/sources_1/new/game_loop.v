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
    parameter PADDLE_VEL_ABS = 10,
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
    input start_btn,
    
    output reg signed[$clog2(D_WIDTH)+1:0] ball_x,
    output reg signed[$clog2(D_HEIGHT)+1:0] ball_y,
    output reg signed[$clog2(D_WIDTH)+1:0] paddle_x,
    output reg signed[$clog2(D_HEIGHT)+1:0] paddle_y
    );
    
    // game state machine
    localparam GAME_BEGIN = 3'b001;
    localparam GAME_RUNNING = 3'b010;
    localparam GAME_OVER = 3'b100;
    
    wire balls_to_the_wall;
    reg[2:0] current_game_state, next_game_state;
    always @(posedge clk)
    begin
        if (rst) begin
            current_game_state <= GAME_BEGIN;
        end else begin
            current_game_state <= next_game_state;
        end
    end
    
    always @ *
    begin
        case (current_game_state)
            GAME_BEGIN:
                if (start_btn) begin
                    next_game_state = GAME_RUNNING;
                end else begin
                    next_game_state = current_game_state;
                end
            GAME_RUNNING:
                if (balls_to_the_wall) begin
                    next_game_state = GAME_OVER;
                end else begin
                    next_game_state = current_game_state;
                end
            GAME_OVER:
                if (start_btn) begin
                    next_game_state = GAME_RUNNING;
                end else begin
                    next_game_state = current_game_state;
                end
            default:
                next_game_state = current_game_state;
        endcase
    end
    
//////////////////////////////////////////////////////////////
    
    reg signed[$clog2(D_WIDTH)+1:0] ball_x_next;
    reg signed[$clog2(D_HEIGHT)+1:0] ball_y_next;

    // position control 
    localparam BALL_X_START = 320;
    localparam BALL_Y_START = 150;
    
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
        if (current_game_state != GAME_RUNNING && next_game_state != GAME_RUNNING) begin
            ball_x_next = BALL_X_START;
            ball_y_next = BALL_Y_START;
        end else if (frame_start) begin
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

    wire upper_hit = (ball_top <= WALL_WIDTH);
    wire lower_hit = (ball_bottom >= D_HEIGHT-WALL_WIDTH);
    
    // TODO: change with paddle position later
    wire left_hit = (ball_left <= WALL_WIDTH);
    wire right_hit = (ball_right >= D_WIDTH-WALL_WIDTH);
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
            x_vel_ball <= 0;
            y_vel_ball <= 0;
        end else begin
            x_vel_ball <= x_vel_ball_next;
            y_vel_ball <= y_vel_ball_next;
        end
    end
    
    always @ * 
    begin
        // tying reset values of the state to state trnsition itself
        if (current_game_state != GAME_RUNNING && next_game_state != GAME_RUNNING) begin
            x_vel_ball_next = 0;
            y_vel_ball_next = 0;
        end else if (current_game_state != GAME_RUNNING && next_game_state == GAME_RUNNING) begin
            x_vel_ball_next = BALL_VEL_POS;
            y_vel_ball_next = BALL_VEL_POS;
        end else begin
            // catch all
            x_vel_ball_next = x_vel_ball;
            y_vel_ball_next = y_vel_ball;   
            if (frame_start) begin
                if (current_game_state != GAME_RUNNING) begin
                    x_vel_ball_next = 0;
                    y_vel_ball_next = 0;
                end else begin
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
    wire signed[$clog2(D_HEIGHT)+1:0] paddle_top;
    wire signed[$clog2(D_HEIGHT)+1:0] paddle_bottom;

    assign paddle_top = paddle_y-PADDLE_LENGTH/2;
    assign paddle_bottom = paddle_y+PADDLE_LENGTH/2;
    assign balls_to_the_wall = (ball_left <= WALL_WIDTH/2) && ((ball_bottom <= paddle_top+5) || (ball_top >= paddle_bottom-5));
    
    wire paddle_bottom_hit = (paddle_y > D_HEIGHT-WALL_WIDTH-PADDLE_LENGTH/2);
    wire paddle_top_hit = (paddle_y < WALL_WIDTH+PADDLE_LENGTH/2);
    
    localparam PADDLE_VEL_POS = PADDLE_VEL_ABS;
    localparam PADDLE_VEL_NEG = -1*PADDLE_VEL_ABS;
   /////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////
endmodule