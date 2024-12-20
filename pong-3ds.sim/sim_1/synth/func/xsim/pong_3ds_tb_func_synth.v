// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Thu Dec 19 22:38:05 2024
// Host        : iNOMAL running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/projects/viris-core/pong3d-simplified/pong3d-simplified.sim/sim_1/synth/func/xsim/pong_3ds_tb_func_synth.v
// Design      : pong3ds
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

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
  wire tim_25mhz_c;

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
       (.I0(\clk_dev_reg_n_0_[0] ),
        .I1(\clk_dev_reg_n_0_[1] ),
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
  LUT2 #(
    .INIT(4'h8)) 
    tim_25mhz_i_1
       (.I0(\clk_dev_reg_n_0_[1] ),
        .I1(\clk_dev_reg_n_0_[0] ),
        .O(tim_25mhz_c));
  FDRE #(
    .INIT(1'b0)) 
    tim_25mhz_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(tim_25mhz_c),
        .Q(tim_25mhz),
        .R(1'b0));
endmodule

module vga
   (v_sync_OBUF,
    blue_ch_OBUF,
    h_sync_OBUF,
    rst_IBUF,
    clk_IBUF_BUFG,
    tim_25mhz);
  output v_sync_OBUF;
  output [0:0]blue_ch_OBUF;
  output h_sync_OBUF;
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
  wire \h_pixel_ctr[8]_i_2_n_0 ;
  wire \h_pixel_ctr[9]_i_1_n_0 ;
  wire \h_pixel_ctr[9]_i_2_n_0 ;
  wire \h_pixel_ctr[9]_i_4_n_0 ;
  wire \h_pixel_ctr[9]_i_5_n_0 ;
  wire [9:9]h_pixel_ctr_next;
  wire h_sync_OBUF;
  wire h_sync_OBUF_inst_i_2_n_0;
  wire h_sync_OBUF_inst_i_3_n_0;
  wire \red_ch_OBUF[3]_inst_i_2_n_0 ;
  wire rst_IBUF;
  wire tim_25mhz;
  wire [9:0]v_line_ctr;
  wire [9:0]v_line_ctr_next;
  wire \v_line_ctr_next_reg[0]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[1]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[1]_i_2_n_0 ;
  wire \v_line_ctr_next_reg[1]_i_3_n_0 ;
  wire \v_line_ctr_next_reg[2]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[3]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[3]_i_2_n_0 ;
  wire \v_line_ctr_next_reg[4]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[4]_i_2_n_0 ;
  wire \v_line_ctr_next_reg[5]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[6]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[7]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[7]_i_2_n_0 ;
  wire \v_line_ctr_next_reg[8]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[8]_i_2_n_0 ;
  wire \v_line_ctr_next_reg[8]_i_3_n_0 ;
  wire \v_line_ctr_next_reg[9]_i_1_n_0 ;
  wire \v_line_ctr_next_reg[9]_i_2_n_0 ;
  wire \v_line_ctr_next_reg[9]_i_3_n_0 ;
  wire \v_line_ctr_next_reg[9]_i_4_n_0 ;
  wire \v_line_ctr_next_reg[9]_i_5_n_0 ;
  wire \v_line_ctr_next_reg[9]_i_6_n_0 ;
  wire v_sync_OBUF;
  wire v_sync_OBUF_inst_i_2_n_0;

  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \h_pixel_ctr[0]_i_1 
       (.I0(h_pixel_ctr[0]),
        .I1(h_pixel_ctr_next),
        .O(\h_pixel_ctr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \h_pixel_ctr[1]_i_1 
       (.I0(h_pixel_ctr[1]),
        .I1(h_pixel_ctr[0]),
        .I2(h_pixel_ctr_next),
        .O(\h_pixel_ctr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \h_pixel_ctr[2]_i_1 
       (.I0(h_pixel_ctr[2]),
        .I1(h_pixel_ctr[0]),
        .I2(h_pixel_ctr[1]),
        .I3(h_pixel_ctr_next),
        .O(\h_pixel_ctr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
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
  LUT5 #(
    .INIT(32'h000000A6)) 
    \h_pixel_ctr[5]_i_1 
       (.I0(h_pixel_ctr[5]),
        .I1(tim_25mhz),
        .I2(\h_pixel_ctr[8]_i_2_n_0 ),
        .I3(rst_IBUF),
        .I4(h_pixel_ctr_next),
        .O(\h_pixel_ctr[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000A6AA)) 
    \h_pixel_ctr[6]_i_1 
       (.I0(h_pixel_ctr[6]),
        .I1(tim_25mhz),
        .I2(\h_pixel_ctr[8]_i_2_n_0 ),
        .I3(h_pixel_ctr[5]),
        .I4(rst_IBUF),
        .I5(h_pixel_ctr_next),
        .O(\h_pixel_ctr[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000A6AA)) 
    \h_pixel_ctr[7]_i_1 
       (.I0(h_pixel_ctr[7]),
        .I1(tim_25mhz),
        .I2(\h_pixel_ctr[9]_i_4_n_0 ),
        .I3(h_pixel_ctr[6]),
        .I4(rst_IBUF),
        .I5(h_pixel_ctr_next),
        .O(\h_pixel_ctr[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000A6AAAAAA)) 
    \h_pixel_ctr[8]_i_1 
       (.I0(h_pixel_ctr[8]),
        .I1(h_pixel_ctr[6]),
        .I2(\h_pixel_ctr[8]_i_2_n_0 ),
        .I3(h_pixel_ctr[5]),
        .I4(h_pixel_ctr[7]),
        .I5(h_pixel_ctr_next),
        .O(\h_pixel_ctr[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \h_pixel_ctr[8]_i_2 
       (.I0(h_pixel_ctr[3]),
        .I1(h_pixel_ctr[1]),
        .I2(h_pixel_ctr[0]),
        .I3(h_pixel_ctr[2]),
        .I4(h_pixel_ctr[4]),
        .O(\h_pixel_ctr[8]_i_2_n_0 ));
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
        .I2(\h_pixel_ctr[9]_i_4_n_0 ),
        .I3(h_pixel_ctr[6]),
        .I4(h_pixel_ctr[8]),
        .I5(h_pixel_ctr_next),
        .O(\h_pixel_ctr[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8080008080808080)) 
    \h_pixel_ctr[9]_i_3 
       (.I0(tim_25mhz),
        .I1(h_pixel_ctr[8]),
        .I2(h_pixel_ctr[9]),
        .I3(\h_pixel_ctr[8]_i_2_n_0 ),
        .I4(h_pixel_ctr[7]),
        .I5(\h_pixel_ctr[9]_i_5_n_0 ),
        .O(h_pixel_ctr_next));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \h_pixel_ctr[9]_i_4 
       (.I0(h_pixel_ctr[4]),
        .I1(h_pixel_ctr[2]),
        .I2(h_pixel_ctr[0]),
        .I3(h_pixel_ctr[1]),
        .I4(h_pixel_ctr[3]),
        .I5(h_pixel_ctr[5]),
        .O(\h_pixel_ctr[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \h_pixel_ctr[9]_i_5 
       (.I0(h_pixel_ctr[5]),
        .I1(h_pixel_ctr[6]),
        .O(\h_pixel_ctr[9]_i_5_n_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFF8180)) 
    h_sync_OBUF_inst_i_1
       (.I0(h_pixel_ctr[4]),
        .I1(h_pixel_ctr[5]),
        .I2(h_pixel_ctr[6]),
        .I3(h_sync_OBUF_inst_i_2_n_0),
        .I4(h_sync_OBUF_inst_i_3_n_0),
        .O(h_sync_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    h_sync_OBUF_inst_i_2
       (.I0(h_pixel_ctr[2]),
        .I1(h_pixel_ctr[0]),
        .I2(h_pixel_ctr[1]),
        .I3(h_pixel_ctr[3]),
        .O(h_sync_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    h_sync_OBUF_inst_i_3
       (.I0(h_pixel_ctr[7]),
        .I1(h_pixel_ctr[8]),
        .I2(h_pixel_ctr[9]),
        .O(h_sync_OBUF_inst_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h01550000)) 
    \red_ch_OBUF[3]_inst_i_1 
       (.I0(v_line_ctr[9]),
        .I1(h_pixel_ctr[8]),
        .I2(h_pixel_ctr[7]),
        .I3(h_pixel_ctr[9]),
        .I4(\red_ch_OBUF[3]_inst_i_2_n_0 ),
        .O(blue_ch_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \red_ch_OBUF[3]_inst_i_2 
       (.I0(v_line_ctr[7]),
        .I1(v_line_ctr[5]),
        .I2(v_line_ctr[6]),
        .I3(v_line_ctr[8]),
        .O(\red_ch_OBUF[3]_inst_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[0] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[0]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h38)) 
    \v_line_ctr_next_reg[0]_i_1 
       (.I0(\v_line_ctr_next_reg[1]_i_2_n_0 ),
        .I1(tim_25mhz),
        .I2(v_line_ctr[0]),
        .O(\v_line_ctr_next_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[1] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[1]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h58D0)) 
    \v_line_ctr_next_reg[1]_i_1 
       (.I0(tim_25mhz),
        .I1(\v_line_ctr_next_reg[1]_i_2_n_0 ),
        .I2(v_line_ctr[1]),
        .I3(v_line_ctr[0]),
        .O(\v_line_ctr_next_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h0222FFFF)) 
    \v_line_ctr_next_reg[1]_i_2 
       (.I0(\v_line_ctr_next_reg[1]_i_3_n_0 ),
        .I1(v_line_ctr[8]),
        .I2(v_line_ctr[3]),
        .I3(v_line_ctr[2]),
        .I4(v_line_ctr[9]),
        .O(\v_line_ctr_next_reg[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \v_line_ctr_next_reg[1]_i_3 
       (.I0(v_line_ctr[5]),
        .I1(v_line_ctr[4]),
        .I2(v_line_ctr[7]),
        .I3(v_line_ctr[6]),
        .O(\v_line_ctr_next_reg[1]_i_3_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[2] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[2]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[2]));
  LUT6 #(
    .INIT(64'h77F700005555A2A2)) 
    \v_line_ctr_next_reg[2]_i_1 
       (.I0(tim_25mhz),
        .I1(v_line_ctr[9]),
        .I2(\v_line_ctr_next_reg[9]_i_4_n_0 ),
        .I3(v_line_ctr[3]),
        .I4(v_line_ctr[2]),
        .I5(\v_line_ctr_next_reg[4]_i_2_n_0 ),
        .O(\v_line_ctr_next_reg[2]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[3] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[3]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[3]));
  LUT6 #(
    .INIT(64'h3B3B4400FF3B0000)) 
    \v_line_ctr_next_reg[3]_i_1 
       (.I0(\v_line_ctr_next_reg[4]_i_2_n_0 ),
        .I1(tim_25mhz),
        .I2(v_line_ctr[9]),
        .I3(\v_line_ctr_next_reg[3]_i_2_n_0 ),
        .I4(v_line_ctr[3]),
        .I5(v_line_ctr[2]),
        .O(\v_line_ctr_next_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    \v_line_ctr_next_reg[3]_i_2 
       (.I0(v_line_ctr[5]),
        .I1(v_line_ctr[4]),
        .I2(v_line_ctr[7]),
        .I3(v_line_ctr[6]),
        .I4(v_line_ctr[8]),
        .I5(v_line_ctr[9]),
        .O(\v_line_ctr_next_reg[3]_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[4] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[4]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[4]));
  LUT6 #(
    .INIT(64'h55550000DFFF2000)) 
    \v_line_ctr_next_reg[4]_i_1 
       (.I0(tim_25mhz),
        .I1(\v_line_ctr_next_reg[4]_i_2_n_0 ),
        .I2(v_line_ctr[3]),
        .I3(v_line_ctr[2]),
        .I4(v_line_ctr[4]),
        .I5(v_line_ctr[9]),
        .O(\v_line_ctr_next_reg[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \v_line_ctr_next_reg[4]_i_2 
       (.I0(v_line_ctr[0]),
        .I1(v_line_ctr[1]),
        .O(\v_line_ctr_next_reg[4]_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[5] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[5]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[5]));
  LUT5 #(
    .INIT(32'h2A2A1A2A)) 
    \v_line_ctr_next_reg[5]_i_1 
       (.I0(v_line_ctr[5]),
        .I1(v_line_ctr[9]),
        .I2(tim_25mhz),
        .I3(v_line_ctr[4]),
        .I4(\v_line_ctr_next_reg[8]_i_3_n_0 ),
        .O(\v_line_ctr_next_reg[5]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[6] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[6]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[6]));
  LUT6 #(
    .INIT(64'h0C060C0CCCCCCCCC)) 
    \v_line_ctr_next_reg[6]_i_1 
       (.I0(v_line_ctr[5]),
        .I1(v_line_ctr[6]),
        .I2(v_line_ctr[9]),
        .I3(\v_line_ctr_next_reg[8]_i_3_n_0 ),
        .I4(v_line_ctr[4]),
        .I5(tim_25mhz),
        .O(\v_line_ctr_next_reg[6]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[7] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[7]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[7]));
  LUT6 #(
    .INIT(64'h00F00078F0F0F0F0)) 
    \v_line_ctr_next_reg[7]_i_1 
       (.I0(v_line_ctr[5]),
        .I1(v_line_ctr[6]),
        .I2(v_line_ctr[7]),
        .I3(v_line_ctr[9]),
        .I4(\v_line_ctr_next_reg[7]_i_2_n_0 ),
        .I5(tim_25mhz),
        .O(\v_line_ctr_next_reg[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \v_line_ctr_next_reg[7]_i_2 
       (.I0(v_line_ctr[2]),
        .I1(v_line_ctr[3]),
        .I2(v_line_ctr[0]),
        .I3(v_line_ctr[1]),
        .I4(v_line_ctr[4]),
        .O(\v_line_ctr_next_reg[7]_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[8] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[8]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[8]));
  LUT6 #(
    .INIT(64'h0C090C0CCCCCCCCC)) 
    \v_line_ctr_next_reg[8]_i_1 
       (.I0(\v_line_ctr_next_reg[8]_i_2_n_0 ),
        .I1(v_line_ctr[8]),
        .I2(v_line_ctr[9]),
        .I3(\v_line_ctr_next_reg[8]_i_3_n_0 ),
        .I4(v_line_ctr[4]),
        .I5(tim_25mhz),
        .O(\v_line_ctr_next_reg[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \v_line_ctr_next_reg[8]_i_2 
       (.I0(v_line_ctr[6]),
        .I1(v_line_ctr[5]),
        .I2(v_line_ctr[7]),
        .O(\v_line_ctr_next_reg[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \v_line_ctr_next_reg[8]_i_3 
       (.I0(v_line_ctr[1]),
        .I1(v_line_ctr[0]),
        .I2(v_line_ctr[3]),
        .I3(v_line_ctr[2]),
        .O(\v_line_ctr_next_reg[8]_i_3_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_line_ctr_next_reg[9] 
       (.CLR(1'b0),
        .D(\v_line_ctr_next_reg[9]_i_1_n_0 ),
        .G(\v_line_ctr_next_reg[9]_i_2_n_0 ),
        .GE(1'b1),
        .Q(v_line_ctr_next[9]));
  LUT6 #(
    .INIT(64'hA222FFFFA222A222)) 
    \v_line_ctr_next_reg[9]_i_1 
       (.I0(v_line_ctr[9]),
        .I1(tim_25mhz),
        .I2(\v_line_ctr_next_reg[9]_i_3_n_0 ),
        .I3(\v_line_ctr_next_reg[9]_i_4_n_0 ),
        .I4(\red_ch_OBUF[3]_inst_i_2_n_0 ),
        .I5(\v_line_ctr_next_reg[9]_i_5_n_0 ),
        .O(\v_line_ctr_next_reg[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h80FF)) 
    \v_line_ctr_next_reg[9]_i_2 
       (.I0(\v_line_ctr_next_reg[9]_i_6_n_0 ),
        .I1(h_pixel_ctr[8]),
        .I2(h_pixel_ctr[9]),
        .I3(tim_25mhz),
        .O(\v_line_ctr_next_reg[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \v_line_ctr_next_reg[9]_i_3 
       (.I0(v_line_ctr[2]),
        .I1(v_line_ctr[3]),
        .O(\v_line_ctr_next_reg[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \v_line_ctr_next_reg[9]_i_4 
       (.I0(v_line_ctr[8]),
        .I1(v_line_ctr[6]),
        .I2(v_line_ctr[7]),
        .I3(v_line_ctr[4]),
        .I4(v_line_ctr[5]),
        .O(\v_line_ctr_next_reg[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    \v_line_ctr_next_reg[9]_i_5 
       (.I0(v_line_ctr[9]),
        .I1(tim_25mhz),
        .I2(v_line_ctr[4]),
        .I3(\v_line_ctr_next_reg[4]_i_2_n_0 ),
        .I4(v_line_ctr[3]),
        .I5(v_line_ctr[2]),
        .O(\v_line_ctr_next_reg[9]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \v_line_ctr_next_reg[9]_i_6 
       (.I0(h_pixel_ctr[5]),
        .I1(h_pixel_ctr[6]),
        .I2(h_pixel_ctr[7]),
        .I3(\h_pixel_ctr[8]_i_2_n_0 ),
        .O(\v_line_ctr_next_reg[9]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[0]),
        .Q(v_line_ctr[0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[1]),
        .Q(v_line_ctr[1]),
        .R(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \v_line_ctr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[2]),
        .Q(v_line_ctr[2]),
        .S(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \v_line_ctr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[3]),
        .Q(v_line_ctr[3]),
        .S(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[4]),
        .Q(v_line_ctr[4]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[5]),
        .Q(v_line_ctr[5]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[6]),
        .Q(v_line_ctr[6]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[7]),
        .Q(v_line_ctr[7]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \v_line_ctr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[8]),
        .Q(v_line_ctr[8]),
        .R(rst_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \v_line_ctr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(v_line_ctr_next[9]),
        .Q(v_line_ctr[9]),
        .S(rst_IBUF));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEEEF)) 
    v_sync_OBUF_inst_i_1
       (.I0(v_line_ctr[4]),
        .I1(v_line_ctr[9]),
        .I2(v_line_ctr[1]),
        .I3(v_line_ctr[0]),
        .I4(v_line_ctr[2]),
        .I5(v_sync_OBUF_inst_i_2_n_0),
        .O(v_sync_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
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
