`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 11:23:28 PM
// Design Name: 
// Module Name: pong-3ds-tb
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


module pong_3ds_tb();
    reg rst, clk;
    initial begin
        rst = 1;
        #42
        rst = 0; 
    end
    initial begin
        clk = 0;
        forever
        #5 clk = ~clk;  
    end
    pong3ds pong3ds_uut (.clk(clk), .rst(rst));
endmodule
