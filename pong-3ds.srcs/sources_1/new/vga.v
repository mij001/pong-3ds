`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 07:39:34 PM
// Design Name: 
// Module Name: vga
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

module vga #(
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
    input tim_25mhz,
    input [3:0] red_ch_in,
    input [3:0] green_ch_in,
    input [3:0] blue_ch_in,
    
    output reg frame_start,
    output reg[$clog2(H_ACTIVE_REGION)-1:0] x_coord,
    output reg[$clog2(V_ACTIVE_REGION)-1:0] y_coord,
    output reg h_sync,
    output reg v_sync,
    output reg[3:0] red_ch_out,
    output reg[3:0] green_ch_out,
    output reg[3:0] blue_ch_out
    );
    
    /////////////////////    parameter declarations    ///////////////////////////
    localparam H_TOTAL = H_ACTIVE_REGION+H_FRONT_PORCH+H_SYNC_PULSE+H_BACK_PORCH;
    localparam H_TOTAL_bits = $clog2(H_TOTAL);
    
    localparam V_TOTAL = V_ACTIVE_REGION+V_FRONT_PORCH+V_SYNC_PULSE+V_BACK_PORCH;
    localparam V_TOTAL_bits = $clog2(V_TOTAL);
    
    localparam H_ACTIVE_BEGIN = 0;
    localparam V_ACTIVE_BEGIN = 0;
    
    localparam H_ACTIVE_END = H_ACTIVE_REGION;
    localparam V_ACTIVE_END = V_ACTIVE_REGION;
    
    localparam HSYNC_BEGIN = H_ACTIVE_REGION+H_FRONT_PORCH-1;
    localparam HSYNC_END = H_ACTIVE_REGION+H_FRONT_PORCH+H_SYNC_PULSE;
    
    localparam VSYNC_BEGIN = V_ACTIVE_REGION+V_FRONT_PORCH-1;
    localparam VSYNC_END = V_ACTIVE_REGION+V_FRONT_PORCH+V_SYNC_PULSE;
    
    localparam BLACK = 0;
    localparam WHITE = 4'b1111;
    //////////////////////////////////////////////////////////////////////////////

    ///////////////////////    vsync and hsync counters    ///////////////////////
    reg[H_TOTAL_bits:0] h_pixel_ctr;
    reg[H_TOTAL_bits:0] h_pixel_ctr_next;

    reg[V_TOTAL_bits:0] v_line_ctr;
    reg[V_TOTAL_bits:0] v_line_ctr_next;
    
    always @ *
    begin
        if (tim_25mhz) begin
        v_line_ctr_next = v_line_ctr;
        h_pixel_ctr_next = h_pixel_ctr;
        
            if (h_pixel_ctr >= H_TOTAL-1) begin
                h_pixel_ctr_next = 0;
                ////////////// vertical////////////
                if (v_line_ctr >= V_TOTAL-1) begin
                    v_line_ctr_next = 0;
                end else begin
                    v_line_ctr_next = v_line_ctr+1;
                end
                ///////////////////////////////////
            end else begin
                h_pixel_ctr_next = h_pixel_ctr+1;
            end            
        end else begin
            h_pixel_ctr_next = h_pixel_ctr;
            v_line_ctr_next = v_line_ctr;
        end
        
    end 
    
    // double flops /////////// not necessary it seems
    ////////////////////////////////////////////////////
    
    always @ (posedge clk)
    begin
        if (rst) begin
            h_pixel_ctr <= H_TOTAL-1;
            v_line_ctr <= V_TOTAL-1; 
        end else begin
            h_pixel_ctr <= h_pixel_ctr_next;
            v_line_ctr <= v_line_ctr_next;
        end
    end
    //////////////////////////////////////////////////////////////////////////////

    // hsync, vsync, frame start and active signals are done by comb
    wire vga_active;
    assign vga_active = h_vga_active & v_vga_active;
    
    reg h_vga_active, v_vga_active;
    always @* begin
        // hsync pulse creation
        if (h_pixel_ctr >= HSYNC_BEGIN && h_pixel_ctr <= HSYNC_END-1) begin
            h_sync = 0;
        end else begin
            h_sync = 1;
        end
        // vsync pulse creation
        if (v_line_ctr >= VSYNC_BEGIN && v_line_ctr <= VSYNC_END-1) begin
            v_sync = 0;
        end else begin
            v_sync = 1;
        end
        // horizn vga active pulse creation
        if (h_pixel_ctr >= H_ACTIVE_BEGIN && h_pixel_ctr <= H_ACTIVE_END-1) begin
            h_vga_active = 1;
        end else begin
            h_vga_active = 0;
        end
        // vert vga active pulse creation
        if (v_line_ctr == VSYNC_BEGIN && h_pixel_ctr == HSYNC_BEGIN) begin
            v_vga_active = 1;
        end else begin
            v_vga_active = 0;
        end
        
        // frame start pulse creation
        if (v_line_ctr == V_ACTIVE_BEGIN && v_line_ctr == V_ACTIVE_END-1) begin
            frame_start = 1;
        end else begin
            frame_start = 0;
        end
    end
    
    // putting pixels on screen when the "beam" is on the active region
    // as well as outputting current coordinate
    always @ *
    begin
        if(vga_active) begin
            red_ch_out = red_ch_in;
            green_ch_out = green_ch_in;
            blue_ch_out = blue_ch_in;
            
            x_coord = h_pixel_ctr;
            y_coord = v_line_ctr;
        end else begin      
            red_ch_out = BLACK;
            green_ch_out = BLACK;
            blue_ch_out = BLACK;
            
            x_coord = 0;
            y_coord = 0;
        end
    end
endmodule