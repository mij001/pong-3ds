`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 07:41:06 PM
// Design Name: 
// Module Name: tim_25mhz_en
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


module tim_25mhz_en (
    input clk,
    input rst,
    output reg tim_25mhz
    );
    
    // clock devider - pixel_clk
    localparam CLK_PRESCALAR = 4;
    localparam CLK_PRESCALAR_bits = $clog2(CLK_PRESCALAR);
    
    reg[CLK_PRESCALAR_bits:0] clk_dev;
    reg[CLK_PRESCALAR_bits:0] clk_dev_next;
    reg tim_25mhz_next;
    
    always @* 
    begin
        if (clk_dev >= CLK_PRESCALAR-1) begin
            clk_dev_next = 0;
        end else begin 
            clk_dev_next = clk_dev+1;
        end
        // make enable high when counter reaches maximum
        if (clk_dev == CLK_PRESCALAR-1) begin
            tim_25mhz_next = 1;
        end else begin
            tim_25mhz_next = 0;
        end
    end
   
    always @ (posedge clk)
    begin
        if (rst) begin
            clk_dev <= CLK_PRESCALAR-1;
            tim_25mhz <= 0;
        end else begin
            clk_dev <= clk_dev_next;
            tim_25mhz <= tim_25mhz_next;
        end
    end 
endmodule
