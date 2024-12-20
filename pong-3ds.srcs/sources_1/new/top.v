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
    output wire h_sync,
    output wire v_sync,
    output wire [3:0] red_ch,
    output wire [3:0] green_ch,
    output wire [3:0] blue_ch
    );
    
    // clock devider - pixel_clk
    wire tim_25mhz;
    tim_25mhz_en clk_dev_mdl (.clk(clk), .rst(rst), .tim_25mhz(tim_25mhz));

    // vga
    wire[$clog2(H_ACTIVE_REGION)-1:0] x_coord;
    wire[$clog2(V_ACTIVE_REGION)-1:0] y_coord;
    wire frame_start;
    wire [3:0] red_ch;
    wire [3:0] green_ch;
    wire [3:0] blue_ch;
    
    wire[3:0] red_ch_in;
    wire[3:0] green_ch_in;
    wire[3:0] blue_ch_in;
    
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
    ///////// update game loop  /////////
    wire[$clog2(H_ACTIVE_REGION)-1:0] ball_x;
    wire[$clog2(H_ACTIVE_REGION)-1:0] ball_y;
    wire[$clog2(H_ACTIVE_REGION)-1:0] paddle_x;
    wire[$clog2(H_ACTIVE_REGION)-1:0] paddle_y;
    game_loop game (
                   .clk(clk),
                   .rst(rst),
                   .frame_start(frame_start),
                   .ball_x(ball_x),
                   .ball_y(ball_y),
                   .paddle_x(paddle_x),
                   .paddle_y(paddle_y),
                   .btn_up(btn_up),
                   .btn_down(btn_down)
    );

/*********test*********/
`ifdef SCREEN_TEST
    always @ * 
    begin
        if (x_coord >= 200 && x_coord <= 300 && y_coord >= 150 && y_coord <= 250) begin
            red_ch_in = WHITE;
            green_ch_in = BLACK;
            blue_ch_in = BLACK;
        end else begin
            red_ch_in = WHITE;
            green_ch_in = BLACK;
            blue_ch_in = WHITE;
        end
    end  
`endif
/**********************/

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
   //////////////////////////////////////       
       
       
       
//    localparam H_TOTAL = H_ACTIVE_REGION+H_FRONT_PORCH+H_SYNC_PULSE+H_BACK_PORCH;
//    localparam H_TOTAL_bits = $clog2(H_TOTAL);
//    reg[H_TOTAL_bits:0] h_pixel_ctr;
//    reg[H_TOTAL_bits:0] h_pixel_ctr_next;
//    localparam V_TOTAL = V_ACTIVE_REGION+V_FRONT_PORCH+V_SYNC_PULSE+V_BACK_PORCH;
//    localparam V_TOTAL_bits = $clog2(V_TOTAL);
//    reg[V_TOTAL_bits:0] v_line_ctr;
//    reg[V_TOTAL_bits:0] v_line_ctr_next;
//    always @ * begin
//        // update pixel counter when prescaler counter done a round
//        if (clk_dev == 0) begin
//            if (h_pixel_ctr >= H_TOTAL-1) begin
//                h_pixel_ctr_next=0;
//            end else begin
//                h_pixel_ctr_next=h_pixel_ctr+1;
//            end    
//        end else begin
//            // to stop the latch inferred in the synth
//            h_pixel_ctr_next=h_pixel_ctr;
//        end
        
//        // update v hounter when a line is finished
//        if (h_pixel_ctr == 0 && clk_dev == 0) begin
//            if (v_line_ctr >= V_TOTAL-1) begin
//                v_line_ctr_next =0;
//            end else begin
//                v_line_ctr_next=v_line_ctr+1;
//            end    
//        end else begin
//            v_line_ctr_next = v_line_ctr;
//        end
//    end
    
//    // hsync, vsync and active signals are done by comb. assign stmnts
//    localparam H_ACTIVE_BEGIN = 0;
//    localparam V_ACTIVE_BEGIN = 0;
//    localparam H_ACTIVE_END = H_ACTIVE_REGION;
//    localparam V_ACTIVE_END = V_ACTIVE_REGION;
//    localparam HSYNC_BEGIN = H_ACTIVE_REGION+H_FRONT_PORCH;
//    localparam HSYNC_END = H_ACTIVE_REGION+H_FRONT_PORCH+H_SYNC_PULSE;
//    localparam VSYNC_BEGIN = V_ACTIVE_REGION+V_FRONT_PORCH;
//    localparam VSYNC_END = V_ACTIVE_REGION+V_FRONT_PORCH+V_SYNC_PULSE;
//    wire h_sync_c, v_sync_c;
//    reg h_vga_active, v_vga_active;
//    wire h_vga_active_c, v_vga_active_c;
//    assign h_sync_c = (HSYNC_BEGIN <= h_pixel_ctr && h_pixel_ctr <= HSYNC_END-1) ? 0:1;
//    assign v_sync_c = (VSYNC_BEGIN <= v_line_ctr && v_line_ctr <= VSYNC_END-1) ? 0:1;
//    assign h_vga_active_c = (H_ACTIVE_BEGIN <= v_line_ctr && v_line_ctr <= H_ACTIVE_END-1) ? 1:0;
//    assign v_vga_active_c = (V_ACTIVE_BEGIN <= v_line_ctr && v_line_ctr <= V_ACTIVE_END-1) ? 1:0;
//    assign vga_active = h_vga_active_c & v_vga_active;
//    // game parameters generation once per frame
//    reg signed[H_TOTAL_bits:0] x_pos_ball;
//    reg signed[V_TOTAL_bits:0] y_pos_ball;
//    reg signed[H_TOTAL_bits:0] x_vel_ball;
//    reg signed[V_TOTAL_bits:0] y_vel_ball;
//    reg signed[H_TOTAL_bits:0] x_pos_ball_next;
//    reg signed[V_TOTAL_bits:0] y_pos_ball_next;
//    reg signed[H_TOTAL_bits:0] x_vel_ball_next;
//    reg signed[V_TOTAL_bits:0] y_vel_ball_next;
//    localparam BALL_EDGE_FACTOR = 0.01;
//    // sprite sizes
//    localparam BALL_RADIUS = 10;
//    localparam PADDLR_WIDTH = BALL_RADIUS;
//    localparam PADDLR_LENGTH = 100;
//    localparam H_WALL = BALL_RADIUS+5; // $floor(H_ACTIVE_REGION*BALL_EDGE_FACTOR);
//    localparam V_WALL = BALL_RADIUS+5; // $floor(V_ACTIVE_REGION*BALL_EDGE_FACTOR);
//    always @ * begin
//        // frame begining indicatior
//        // calculations starts at the end of the previous
//        // v-sync to give time to comb circuits to settle 
//        if (h_pixel_ctr == 0 && clk_dev == 0 && v_line_ctr == VSYNC_END-1) begin
//            /////////////////// this can now be considered as a game loop //////////////////
//            // reverse ball direction fi hits wall
//            // horizontal
//            if (x_pos_ball <= H_WALL || 
//                x_pos_ball >= H_WALL) begin 
//                x_vel_ball_next=-x_vel_ball;
//            end  else begin
//                x_vel_ball_next=x_vel_ball;
//            end
//            // vertical
//            if (y_pos_ball <= V_WALL || 
//                y_pos_ball >= V_WALL) begin 
//                y_vel_ball_next=-y_vel_ball;
//            end  else begin
//                y_vel_ball_next=-y_vel_ball;
//            end
            
//            // update position of the ball
//            x_pos_ball_next = x_pos_ball+x_vel_ball;
//            y_pos_ball_next = y_pos_ball+y_vel_ball;
//            ////////////////////////////////////////////////////////////////////////////////
//        end
//    end
    
//    ///////////////////////////////////
//    localparam BLACK = 0;
//    localparam WHITE = 4'b1111;
    
//    wire[H_TOTAL_bits:0] pixel_x_pos;
//    wire[V_TOTAL_bits:0] pixel_y_pos;
//    assign pixel_x_pos=h_pixel_ctr;
//    assign pixel_y_pos=v_line_ctr;
    
//    reg [3:0] red_ch_next;
//    reg [3:0] green_ch_next;
//    reg [3:0] blue_ch_next;   
    
//    reg [3:0] red_ch_c2;
//    reg [3:0] green_ch_c2;
//    reg [3:0] blue_ch_c2;  
//    // blitting
//    always @ *
//    begin
//        if (vga_active) begin
//            // if current pixel location is not part of the sprites
//            // black color pixel
//            if (x_pos_ball <= pixel_x_pos+BALL_RADIUS && 
//                x_pos_ball >= pixel_x_pos-BALL_RADIUS &&
//                x_pos_ball <= pixel_y_pos+BALL_RADIUS &&
//                x_pos_ball >= pixel_y_pos-BALL_RADIUS) begin
//                    red_ch_next = WHITE;
//                    green_ch_next = BLACK;
//                    blue_ch_next = BLACK;
//                    /////////////////    PADDLE     /////////////////////
////             end else if (x_pos_ball <= pixel_x_pos+BALL_RADIUS && 
////                x_pos_ball >= pixel_x_pos-BALL_RADIUS &&
////                x_pos_ball <= pixel_y_pos+BALL_RADIUS &&
////                x_pos_ball >= pixel_y_pos-BALL_RADIUS) begin
////                    red_ch_next = WHITE;
////                    green_ch_next = WHITE;
////                    blue_ch_next = WHITE;             
//            end else begin
//                red_ch_next = WHITE;
//                green_ch_next = WHITE;
//                blue_ch_next = WHITE;
//            end            
//        end else begin
//            red_ch_next = BLACK;
//            green_ch_next = BLACK;
//            blue_ch_next = BLACK;
//        end
//    end
    
//    // registering outputs to avoid glitches and double flopping syncs
//    reg h_sync_c2;
//    reg v_sync_c2;
//    always @ (posedge clk)
//    begin
//        if (rst) begin
//            clk_dev <= 0;
//            h_pixel_ctr <= 0;
//            v_line_ctr <= 0;
//            x_pos_ball <= H_ACTIVE_END*0.75;
//            y_pos_ball <= V_ACTIVE_END*0.75;
//        end else begin
//            // TODO: doubleflop them all to match the delay of the h&v syncs
//            clk_dev <= clk_dev_next;
//            h_pixel_ctr<=h_pixel_ctr_next;
//            v_line_ctr<=v_line_ctr_next;
            
//            // double flopping
//            h_sync_c2 <= h_sync_c;
//            h_sync <= h_sync_c2;
//            v_sync_c2 <= v_sync_c;
//            v_sync <= v_sync_c2;
            
//            h_vga_active <= h_vga_active_c;
//            v_vga_active <= v_vga_active_c;
            
//            x_vel_ball <= x_vel_ball_next;
//            y_vel_ball <= y_vel_ball_next;
            
//            red_ch_c2 <= red_ch_next;
//            green_ch_c2 <= green_ch_next;
//            blue_ch_c2 <= blue_ch_next;
//            red_ch <= red_ch_c2;
//            green_ch <= green_ch_c2;
//            blue_ch <= blue_ch_c2;
//        end
//    end 
//    // 
    
    
endmodule
