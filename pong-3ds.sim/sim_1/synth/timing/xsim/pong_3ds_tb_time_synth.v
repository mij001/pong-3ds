// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Fri Dec 20 01:22:40 2024
// Host        : iNOMAL running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/projects/vitis-core/pong-3ds/pong-3ds.sim/sim_1/synth/timing/xsim/pong_3ds_tb_time_synth.v
// Design      : pong3ds
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* H_ACTIVE_REGION = "640" *) (* H_BACK_PORCH = "48" *) (* H_FRONT_PORCH = "16" *) 
(* H_SYNC_PULSE = "96" *) (* V_ACTIVE_REGION = "480" *) (* V_BACK_PORCH = "33" *) 
(* V_FRONT_PORCH = "10" *) (* V_SYNC_PULSE = "2" *) 
(* NotValidForBitStream *)
module pong3ds
   (clk,
    rst,
    h_sync,
    v_sync,
    red_ch,
    green_ch,
    blue_ch);
  input clk;
  input rst;
  output h_sync;
  output v_sync;
  output [3:0]red_ch;
  output [3:0]green_ch;
  output [3:0]blue_ch;

  wire [3:0]blue_ch;
  wire [0:0]blue_ch_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [3:0]green_ch;
  wire h_sync;
  wire h_sync_OBUF;
  wire [3:0]red_ch;
  wire rst;
  wire rst_IBUF;
  wire tim_25mhz;
  wire v_sync;
  wire v_sync_OBUF;

initial begin
 $sdf_annotate("pong_3ds_tb_time_synth.sdf",,,,"tool_control");
end
  OBUF \blue_ch_OBUF[0]_inst 
       (.I(blue_ch_OBUF),
        .O(blue_ch[0]));
  OBUF \blue_ch_OBUF[1]_inst 
       (.I(blue_ch_OBUF),
        .O(blue_ch[1]));
  OBUF \blue_ch_OBUF[2]_inst 
       (.I(blue_ch_OBUF),
        .O(blue_ch[2]));
  OBUF \blue_ch_OBUF[3]_inst 
       (.I(blue_ch_OBUF),
        .O(blue_ch[3]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  tim_25mhz_en clk_dev_mdl
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_IBUF(rst_IBUF),
        .tim_25mhz(tim_25mhz));
  vga display_vga
       (.blue_ch_OBUF(blue_ch_OBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .h_sync_OBUF(h_sync_OBUF),
        .rst_IBUF(rst_IBUF),
        .tim_25mhz(tim_25mhz),
        .v_sync_OBUF(v_sync_OBUF));
  OBUF \green_ch_OBUF[0]_inst 
       (.I(blue_ch_OBUF),
        .O(green_ch[0]));
  OBUF \green_ch_OBUF[1]_inst 
       (.I(blue_ch_OBUF),
        .O(green_ch[1]));
  OBUF \green_ch_OBUF[2]_inst 
       (.I(blue_ch_OBUF),
        .O(green_ch[2]));
  OBUF \green_ch_OBUF[3]_inst 
       (.I(blue_ch_OBUF),
        .O(green_ch[3]));
  OBUF h_sync_OBUF_inst
       (.I(h_sync_OBUF),
        .O(h_sync));
  OBUF \red_ch_OBUF[0]_inst 
       (.I(blue_ch_OBUF),
        .O(red_ch[0]));
  OBUF \red_ch_OBUF[1]_inst 
       (.I(blue_ch_OBUF),
        .O(red_ch[1]));
  OBUF \red_ch_OBUF[2]_inst 
       (.I(blue_ch_OBUF),
        .O(red_ch[2]));
  OBUF \red_ch_OBUF[3]_inst 
       (.I(blue_ch_OBUF),
        .O(red_ch[3]));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  OBUF v_sync_OBUF_inst
       (.I(v_sync_OBUF),
        .O(v_sync));
endmodule

module tim_25mhz_en
   (tim_25mhz,
    clk_IBUF_BUFG,
    rst_IBUF);
  output tim_25mhz;
  input clk_IBUF_BUFG;
  input rst_IBUF;

  wire clk_IBUF_BUFG;
  wire \clk_dev[0]_i_1_n_0 ;
  wire \clk_dev[1]_i_1_n_0 ;
  wire \clk_dev_reg_n_0_[0] ;
  wire \clk_dev_reg_n_0_[1] ;
  wire rst_IBUF;
  wire tim_25mhz;
  wire tim_25mhz_i_1_n_0;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \clk_dev[0]_i_1 
       (.I0(\clk_dev_reg_n_0_[0] ),
        .O(\clk_dev[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clk_dev[1]_i_1 
       (.I0(\clk_dev_reg_n_0_[1] ),
        .I1(\clk_dev_reg_n_0_[0] ),
        .O(\clk_dev[1]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \clk_dev_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clk_dev[0]_i_1_n_0 ),
        .Q(\clk_dev_reg_n_0_[0] ),
        .S(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \clk_dev_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clk_dev[1]_i_1_n_0 ),
        .Q(\clk_dev_reg_n_0_[1] ),
        .S(rst_IBUF));
  LUT3 #(
    .INIT(8'h08)) 
    tim_25mhz_i_1
       (.I0(\clk_dev_reg_n_0_[0] ),
        .I1(\clk_dev_reg_n_0_[1] ),
        .I2(rst_IBUF),
        .O(tim_25mhz_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tim_25mhz_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(tim_25mhz_i_1_n_0),
        .Q(tim_25mhz),
        .R(1'b0));
endmodule

module vga
   (h_sync_OBUF,
    v_sync_OBUF,
    blue_ch_OBUF,
    rst_IBUF,
    clk_IBUF_BUFG,
    tim_25mhz);
  output h_sync_OBUF;
  output v_sync_OBUF;
  output [0:0]blue_ch_OBUF;
  input rst_IBUF;
  input clk_IBUF_BUFG;
  input tim_25mhz;

  wire [0:0]blue_ch_OBUF;
  wire clk_IBUF_BUFG;
  wire [9:0]h_pixel_ctr;
  wire \h_pixel_ctr[0]_i_1_n_0 ;
  wire \h_pixel_ctr[1]_i_1_n_0 ;
  wire \h_pixel_ctr[2]_i_1_n_0 ;
  wire \h_pixel_ctr[3]_i_1_n_0 ;
  wire \h_pixel_ctr[4]_i_1_n_0 ;
  wire \h_pixel_ctr[5]_i_1_n_0 ;
  wire \h_pixel_ctr[6]_i_1_n_0 ;
  wire \h_pixel_ctr[7]_i_1_n_0 ;
  wire \h_pixel_ctr[8]_i_1_n_0 ;
  wire \h_pixel_ctr[9]_i_1_n_0 ;
  wire \h_pixel_ctr[9]_i_2_n_0 ;
  wire \h_pixel_ctr[9]_i_3_n_0 ;
  wire [9:9]h_pixel_ctr_next;
  wire h_sync_OBUF;
  wire h_sync_OBUF_inst_i_2_n_0;
  wire h_sync_OBUF_inst_i_3_n_0;
  wire [9:0]p_1_in;
  wire \red_ch_OBUF[3]_inst_i_2_n_0 ;
  wire rst_IBUF;
  wire tim_25mhz;
  wire [9:0]v_line_ctr;
  wire \v_line_ctr[2]_i_1_n_0 ;
  wire \v_line_ctr[3]_i_1_n_0 ;
  wire \v_line_ctr[3]_i_2_n_0 ;
  wire \v_line_ctr[3]_i_3_n_0 ;
  wire \v_line_ctr[8]_i_1_n_0 ;
  wire \v_line_ctr[8]_i_4_n_0 ;
  wire \v_line_ctr[8]_i_5_n_0 ;
  wire \v_line_ctr[8]_i_6_n_0 ;
  wire \v_line_ctr[9]_i_1_n_0 ;
  wire v_sync_OBUF;
  wire v_sync_OBUF_inst_i_2_n_0;

  LUT2 #(
    .INIT(4'h1)) 
    \h_pixel_ctr[0]_i_1 
       (.I0(h_pixel_ctr[0]),
        .I1(h_pixel_ctr_next),
        .O(\h_pixel_ctr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \h_pixel_ctr[1]_i_1 
       (.I0(h_pixel_ctr[1]),
        .I1(h_pixel_ctr[0]),
        .I2(h_pixel_ctr_next),
        .O(\h_pixel_ctr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \h_pixel_ctr[2]_i_1 
       (.I0(h_pixel_ctr[2]),
        .I1(h_pixel_ctr[0]),
        .I2(h_pixel_ctr[1]),
        .I3(h_pixel_ctr_next),
        .O(\h_pixel_ctr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \h_pixel_ctr[3]_i_1 
       (.I0(h_pixel_ctr[3]),
        .I1(h_pixel_ctr[1]),
        .I2(h_pixel_ctr[0]),
        .I3(h_pixel_ctr[2]),
        .I4(h_pixel_ctr_next),
        .O(\h_pixel_ctr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000006AAAAAAA)) 
    \h_pixel_ctr[4]_i_1 
       (.I0(h_pixel_ctr[4]),
        .I1(h_pixel_ctr[2]),
        .I2(h_pixel_ctr[0]),
        .I3(h_pixel_ctr[1]),
        .I4(h_pixel_ctr[3]),
        .I5(h_pixel_ctr_next),
        .O(\h_pixel_ctr[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000A6AA)) 
    \h_pixel_ctr[5]_i_1 
       (.I0(h_pixel_ctr[5]),
        .I1(tim_25mhz),
        .I2(h_sync_OBUF_inst_i_3_n_0),
        .I3(h_pixel_ctr[4]),
        .I4(rst_IBUF),
        .I5(h_pixel_ctr_next),
        .O(\h_pixel_ctr[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000000A6)) 
    \h_pixel_ctr[6]_i_1 
       (.I0(h_pixel_ctr[6]),
        .I1(tim_25mhz),
        .I2(\h_pixel_ctr[9]_i_3_n_0 ),
        .I3(rst_IBUF),
        .I4(h_pixel_ctr_next),
        .O(\h_pixel_ctr[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000A6AA)) 
    \h_pixel_ctr[7]_i_1 
       (.I0(h_pixel_ctr[7]),
        .I1(tim_25mhz),
        .I2(\h_pixel_ctr[9]_i_3_n_0 ),
        .I3(h_pixel_ctr[6]),
        .I4(rst_IBUF),
        .I5(h_pixel_ctr_next),
        .O(\h_pixel_ctr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0000A6AA)) 
    \h_pixel_ctr[8]_i_1 
       (.I0(h_pixel_ctr[8]),
        .I1(h_pixel_ctr[6]),
        .I2(\h_pixel_ctr[9]_i_3_n_0 ),
        .I3(h_pixel_ctr[7]),
        .I4(h_pixel_ctr_next),
        .O(\h_pixel_ctr[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \h_pixel_ctr[9]_i_1 
       (.I0(tim_25mhz),
        .I1(h_pixel_ctr_next),
        .O(\h_pixel_ctr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000A6AAAAAA)) 
    \h_pixel_ctr[9]_i_2 
       (.I0(h_pixel_ctr[9]),
        .I1(h_pixel_ctr[7]),
        .I2(\h_pixel_ctr[9]_i_3_n_0 ),
        .I3(h_pixel_ctr[6]),
        .I4(h_pixel_ctr[8]),
        .I5(h_pixel_ctr_next),
        .O(\h_pixel_ctr[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \h_pixel_ctr[9]_i_3 
       (.I0(h_pixel_ctr[4]),
        .I1(h_pixel_ctr[2]),
        .I2(h_pixel_ctr[0]),
        .I3(h_pixel_ctr[1]),
        .I4(h_pixel_ctr[3]),
        .I5(h_pixel_ctr[5]),
        .O(\h_pixel_ctr[9]_i_3_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \h_pixel_ctr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\h_pixel_ctr[9]_i_1_n_0 ),
        .D(\h_pixel_ctr[0]_i_1_n_0 ),
        .Q(h_pixel_ctr[0]),
        .S(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \h_pixel_ctr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\h_pixel_ctr[9]_i_1_n_0 ),
        .D(\h_pixel_ctr[1]_i_1_n_0 ),
        .Q(h_pixel_ctr[1]),
        .S(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \h_pixel_ctr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\h_pixel_ctr[9]_i_1_n_0 ),
        .D(\h_pixel_ctr[2]_i_1_n_0 ),
        .Q(h_pixel_ctr[2]),
        .S(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \h_pixel_ctr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\h_pixel_ctr[9]_i_1_n_0 ),
        .D(\h_pixel_ctr[3]_i_1_n_0 ),
        .Q(h_pixel_ctr[3]),
        .S(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \h_pixel_ctr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\h_pixel_ctr[9]_i_1_n_0 ),
        .D(\h_pixel_ctr[4]_i_1_n_0 ),
        .Q(h_pixel_ctr[4]),
        .S(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \h_pixel_ctr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\h_pixel_ctr[5]_i_1_n_0 ),
        .Q(h_pixel_ctr[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_pixel_ctr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\h_pixel_ctr[6]_i_1_n_0 ),
        .Q(h_pixel_ctr[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_pixel_ctr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\h_pixel_ctr[7]_i_1_n_0 ),
        .Q(h_pixel_ctr[7]),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \h_pixel_ctr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\h_pixel_ctr[9]_i_1_n_0 ),
        .D(\h_pixel_ctr[8]_i_1_n_0 ),
        .Q(h_pixel_ctr[8]),
        .S(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \h_pixel_ctr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\h_pixel_ctr[9]_i_1_n_0 ),
        .D(\h_pixel_ctr[9]_i_2_n_0 ),
        .Q(h_pixel_ctr[9]),
        .S(rst_IBUF));
  LUT6 #(
    .INIT(64'hEAABEAAAFFFFFFFF)) 
    h_sync_OBUF_inst_i_1
       (.I0(h_sync_OBUF_inst_i_2_n_0),
        .I1(h_pixel_ctr[4]),
        .I2(h_pixel_ctr[5]),
        .I3(h_pixel_ctr[6]),
        .I4(h_sync_OBUF_inst_i_3_n_0),
        .I5(h_pixel_ctr[9]),
        .O(h_sync_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    h_sync_OBUF_inst_i_2
       (.I0(h_pixel_ctr[8]),
        .I1(h_pixel_ctr[7]),
        .O(h_sync_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    h_sync_OBUF_inst_i_3
       (.I0(h_pixel_ctr[2]),
        .I1(h_pixel_ctr[0]),
        .I2(h_pixel_ctr[1]),
        .I3(h_pixel_ctr[3]),
        .O(h_sync_OBUF_inst_i_3_n_0));
  LUT5 #(
    .INIT(32'h01550000)) 
    \red_ch_OBUF[3]_inst_i_1 
       (.I0(v_line_ctr[9]),
        .I1(h_pixel_ctr[8]),
        .I2(h_pixel_ctr[7]),
        .I3(h_pixel_ctr[9]),
        .I4(\red_ch_OBUF[3]_inst_i_2_n_0 ),
        .O(blue_ch_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \red_ch_OBUF[3]_inst_i_2 
       (.I0(v_line_ctr[7]),
        .I1(v_line_ctr[5]),
        .I2(v_line_ctr[6]),
        .I3(v_line_ctr[8]),
        .O(\red_ch_OBUF[3]_inst_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \v_line_ctr[0]_i_1 
       (.I0(v_line_ctr[0]),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \v_line_ctr[1]_i_1 
       (.I0(v_line_ctr[0]),
        .I1(v_line_ctr[1]),
        .O(p_1_in[1]));
  LUT6 #(
    .INIT(64'h0F7F7F7F00808080)) 
    \v_line_ctr[2]_i_1 
       (.I0(v_line_ctr[0]),
        .I1(v_line_ctr[1]),
        .I2(h_pixel_ctr_next),
        .I3(v_line_ctr[9]),
        .I4(\v_line_ctr[3]_i_3_n_0 ),
        .I5(v_line_ctr[2]),
        .O(\v_line_ctr[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h3BBB0444)) 
    \v_line_ctr[3]_i_1 
       (.I0(\v_line_ctr[3]_i_2_n_0 ),
        .I1(h_pixel_ctr_next),
        .I2(v_line_ctr[9]),
        .I3(\v_line_ctr[3]_i_3_n_0 ),
        .I4(v_line_ctr[3]),
        .O(\v_line_ctr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \v_line_ctr[3]_i_2 
       (.I0(v_line_ctr[1]),
        .I1(v_line_ctr[0]),
        .I2(v_line_ctr[2]),
        .O(\v_line_ctr[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \v_line_ctr[3]_i_3 
       (.I0(\v_line_ctr[8]_i_4_n_0 ),
        .I1(v_line_ctr[5]),
        .I2(v_line_ctr[4]),
        .O(\v_line_ctr[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \v_line_ctr[4]_i_1 
       (.I0(v_line_ctr[3]),
        .I1(v_line_ctr[1]),
        .I2(v_line_ctr[0]),
        .I3(v_line_ctr[2]),
        .I4(v_line_ctr[4]),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \v_line_ctr[5]_i_1 
       (.I0(v_line_ctr[4]),
        .I1(v_line_ctr[2]),
        .I2(v_line_ctr[0]),
        .I3(v_line_ctr[1]),
        .I4(v_line_ctr[3]),
        .I5(v_line_ctr[5]),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \v_line_ctr[6]_i_1 
       (.I0(v_line_ctr[5]),
        .I1(\v_line_ctr[8]_i_6_n_0 ),
        .I2(v_line_ctr[6]),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \v_line_ctr[7]_i_1 
       (.I0(v_line_ctr[5]),
        .I1(v_line_ctr[6]),
        .I2(\v_line_ctr[8]_i_6_n_0 ),
        .I3(v_line_ctr[7]),
        .O(p_1_in[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFF88888880)) 
    \v_line_ctr[8]_i_1 
       (.I0(h_pixel_ctr_next),
        .I1(v_line_ctr[9]),
        .I2(\v_line_ctr[8]_i_4_n_0 ),
        .I3(v_line_ctr[5]),
        .I4(v_line_ctr[4]),
        .I5(rst_IBUF),
        .O(\v_line_ctr[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAA8000000000000)) 
    \v_line_ctr[8]_i_2 
       (.I0(tim_25mhz),
        .I1(h_pixel_ctr[6]),
        .I2(h_pixel_ctr[5]),
        .I3(\v_line_ctr[8]_i_5_n_0 ),
        .I4(h_pixel_ctr[9]),
        .I5(h_pixel_ctr[8]),
        .O(h_pixel_ctr_next));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    \v_line_ctr[8]_i_3 
       (.I0(\v_line_ctr[8]_i_6_n_0 ),
        .I1(v_line_ctr[6]),
        .I2(v_line_ctr[5]),
        .I3(v_line_ctr[7]),
        .I4(v_line_ctr[8]),
        .O(p_1_in[8]));
  LUT5 #(
    .INIT(32'hFFFEFEFE)) 
    \v_line_ctr[8]_i_4 
       (.I0(v_line_ctr[7]),
        .I1(v_line_ctr[6]),
        .I2(v_line_ctr[8]),
        .I3(v_line_ctr[2]),
        .I4(v_line_ctr[3]),
        .O(\v_line_ctr[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
    \v_line_ctr[8]_i_5 
       (.I0(h_pixel_ctr[3]),
        .I1(h_pixel_ctr[4]),
        .I2(h_pixel_ctr[2]),
        .I3(h_pixel_ctr[1]),
        .I4(h_pixel_ctr[0]),
        .I5(h_pixel_ctr[7]),
        .O(\v_line_ctr[8]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \v_line_ctr[8]_i_6 
       (.I0(v_line_ctr[3]),
        .I1(v_line_ctr[1]),
        .I2(v_line_ctr[0]),
        .I3(v_line_ctr[2]),
        .I4(v_line_ctr[4]),
        .O(\v_line_ctr[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h38383838383838B8)) 
    \v_line_ctr[9]_i_1 
       (.I0(p_1_in[9]),
        .I1(h_pixel_ctr_next),
        .I2(v_line_ctr[9]),
        .I3(\v_line_ctr[8]_i_4_n_0 ),
        .I4(v_line_ctr[5]),
        .I5(v_line_ctr[4]),
        .O(\v_line_ctr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF40000000)) 
    \v_line_ctr[9]_i_2 
       (.I0(\v_line_ctr[8]_i_6_n_0 ),
        .I1(v_line_ctr[7]),
        .I2(v_line_ctr[5]),
        .I3(v_line_ctr[6]),
        .I4(v_line_ctr[8]),
        .I5(v_line_ctr[9]),
        .O(p_1_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(h_pixel_ctr_next),
        .D(p_1_in[0]),
        .Q(v_line_ctr[0]),
        .R(\v_line_ctr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(h_pixel_ctr_next),
        .D(p_1_in[1]),
        .Q(v_line_ctr[1]),
        .R(\v_line_ctr[8]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \v_line_ctr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\v_line_ctr[2]_i_1_n_0 ),
        .Q(v_line_ctr[2]),
        .S(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \v_line_ctr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\v_line_ctr[3]_i_1_n_0 ),
        .Q(v_line_ctr[3]),
        .S(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(h_pixel_ctr_next),
        .D(p_1_in[4]),
        .Q(v_line_ctr[4]),
        .R(\v_line_ctr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(h_pixel_ctr_next),
        .D(p_1_in[5]),
        .Q(v_line_ctr[5]),
        .R(\v_line_ctr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(h_pixel_ctr_next),
        .D(p_1_in[6]),
        .Q(v_line_ctr[6]),
        .R(\v_line_ctr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(h_pixel_ctr_next),
        .D(p_1_in[7]),
        .Q(v_line_ctr[7]),
        .R(\v_line_ctr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(h_pixel_ctr_next),
        .D(p_1_in[8]),
        .Q(v_line_ctr[8]),
        .R(\v_line_ctr[8]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \v_line_ctr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\v_line_ctr[9]_i_1_n_0 ),
        .Q(v_line_ctr[9]),
        .S(rst_IBUF));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFEFEFF)) 
    v_sync_OBUF_inst_i_1
       (.I0(v_sync_OBUF_inst_i_2_n_0),
        .I1(v_line_ctr[9]),
        .I2(v_line_ctr[4]),
        .I3(v_line_ctr[1]),
        .I4(v_line_ctr[0]),
        .I5(v_line_ctr[2]),
        .O(v_sync_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    v_sync_OBUF_inst_i_2
       (.I0(v_line_ctr[8]),
        .I1(v_line_ctr[6]),
        .I2(v_line_ctr[5]),
        .I3(v_line_ctr[7]),
        .I4(v_line_ctr[3]),
        .O(v_sync_OBUF_inst_i_2_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
