`timescale 1 ns / 1 ps
/* ----------------------------------------- *
 * Title       : Custom AXI Lite GPIO        *
 * Project     : Custom AXI Lite GPIO        *
 * ----------------------------------------- *
 * File        : axi_lite_gpio_v1_0.v        *
 * Author      : Yigit Suoglu                *
 * Last Edit   : 01/11/2021                  *
 * ----------------------------------------- *
 * Description : Simple GPIO module with     *
 *               adjustable channels         *
 * ----------------------------------------- */

  module axi_lite_gpio_v1_0 #
  (
    //Parameters of Axi Slave Bus Interface S_AXI, vivado should handle these
    parameter C_S_AXI_DATA_WIDTH = 32,
    parameter C_S_AXI_ADDR_WIDTH = 8,
    parameter C_S_AXI_BASEADDR = 32'hFFFFFFFF, //Defult value at vivado is all 1's

    //Following parameters determine active GPIO numbers
    parameter I_PORT_COUNT = 16,
    parameter O_PORT_COUNT = 16,

    //Following is needed for correct addressing
    parameter ADDR_INC = C_S_AXI_DATA_WIDTH/8,

    //Following parameters for address customization, minimum diffrence between them should be 32*ADDR_INC
    parameter GPO_AXI_ADDR_OFFSET = 0,
    parameter GPI_AXI_ADDR_OFFSET = 32*ADDR_INC
  )(
    // Ports of Axi Slave Bus Interface
    input s_axi_aclk,
    input s_axi_aresetn,
    input [C_S_AXI_ADDR_WIDTH-1:0] s_axi_awaddr,
    input [2:0] s_axi_awprot,
    input  s_axi_awvalid,
    output s_axi_awready,
    input [C_S_AXI_DATA_WIDTH-1:0] s_axi_wdata,
    input [(C_S_AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb,
    input  s_axi_wvalid,
    output s_axi_wready,
    output [1:0] s_axi_bresp,
    output s_axi_bvalid,
    input  s_axi_bready,
    input [C_S_AXI_ADDR_WIDTH-1:0] s_axi_araddr,
    input [2:0] s_axi_arprot,
    input  s_axi_arvalid,
    output s_axi_arready,
    output [C_S_AXI_DATA_WIDTH-1:0] s_axi_rdata,
    output [1:0] s_axi_rresp,
    output s_axi_rvalid,
    input  s_axi_rready,

    input [C_S_AXI_DATA_WIDTH-1:0] in0,
    input [C_S_AXI_DATA_WIDTH-1:0] in1,
    input [C_S_AXI_DATA_WIDTH-1:0] in2,
    input [C_S_AXI_DATA_WIDTH-1:0] in3,
    input [C_S_AXI_DATA_WIDTH-1:0] in4,
    input [C_S_AXI_DATA_WIDTH-1:0] in5,
    input [C_S_AXI_DATA_WIDTH-1:0] in6,
    input [C_S_AXI_DATA_WIDTH-1:0] in7,
    input [C_S_AXI_DATA_WIDTH-1:0] in8,
    input [C_S_AXI_DATA_WIDTH-1:0] in9,
    input [C_S_AXI_DATA_WIDTH-1:0] in10,
    input [C_S_AXI_DATA_WIDTH-1:0] in11,
    input [C_S_AXI_DATA_WIDTH-1:0] in12,
    input [C_S_AXI_DATA_WIDTH-1:0] in13,
    input [C_S_AXI_DATA_WIDTH-1:0] in14,
    input [C_S_AXI_DATA_WIDTH-1:0] in15,
    input [C_S_AXI_DATA_WIDTH-1:0] in16,
    input [C_S_AXI_DATA_WIDTH-1:0] in17,
    input [C_S_AXI_DATA_WIDTH-1:0] in18,
    input [C_S_AXI_DATA_WIDTH-1:0] in19,
    input [C_S_AXI_DATA_WIDTH-1:0] in20,
    input [C_S_AXI_DATA_WIDTH-1:0] in21,
    input [C_S_AXI_DATA_WIDTH-1:0] in22,
    input [C_S_AXI_DATA_WIDTH-1:0] in23,
    input [C_S_AXI_DATA_WIDTH-1:0] in24,
    input [C_S_AXI_DATA_WIDTH-1:0] in25,
    input [C_S_AXI_DATA_WIDTH-1:0] in26,
    input [C_S_AXI_DATA_WIDTH-1:0] in27,
    input [C_S_AXI_DATA_WIDTH-1:0] in28,
    input [C_S_AXI_DATA_WIDTH-1:0] in29,
    input [C_S_AXI_DATA_WIDTH-1:0] in30,
    input [C_S_AXI_DATA_WIDTH-1:0] in31,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out0,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out1,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out2,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out3,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out4,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out5,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out6,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out7,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out8,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out9,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out10,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out11,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out12,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out13,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out14,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out15,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out16,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out17,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out18,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out19,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out20,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out21,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out22,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out23,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out24,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out25,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out26,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out27,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out28,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out29,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out30,
    output reg [C_S_AXI_DATA_WIDTH-1:0] out31
  );
    localparam RES_OKAY = 2'b00,
               RES_ERR  = 2'b10; //Slave error, eg addres does not exist
    localparam OxDEC0DEE3 = 3737181923; // this is also used by interconnect when the address doesn't exist
    localparam OUT_REGS_COUNT = (O_PORT_COUNT == 0) ? 1 : O_PORT_COUNT;

    //Convert addresses
    localparam GPI_RANGE = I_PORT_COUNT * ADDR_INC;
    localparam GPO_RANGE = O_PORT_COUNT * ADDR_INC;
    localparam GPO_ADDR_START = GPO_AXI_ADDR_OFFSET;
    localparam GPI_ADDR_START = GPI_AXI_ADDR_OFFSET;


    //Control signals
    wire  read = s_axi_arvalid;
    wire write = s_axi_awvalid & s_axi_wvalid;
    wire  readAddrValid = ((GPO_ADDR_START <= s_axi_araddr) & (s_axi_araddr < (GPO_ADDR_START+GPO_RANGE))) | 
                          ((GPI_ADDR_START <= s_axi_araddr) & (s_axi_araddr < (GPI_ADDR_START+GPI_RANGE)));
    wire writeAddrValid = ((GPO_ADDR_START <= s_axi_awaddr) & (s_axi_awaddr < (GPO_ADDR_START+GPO_RANGE)));


    //Read Data
    reg [C_S_AXI_DATA_WIDTH-1:0] readData;
    always@* begin
      case(s_axi_araddr) //Cases generated by a script
        (GPI_ADDR_START+00*ADDR_INC): readData = (I_PORT_COUNT >  0) ? in0   : OxDEC0DEE3;
        (GPI_ADDR_START+01*ADDR_INC): readData = (I_PORT_COUNT >  1) ? in1   : OxDEC0DEE3;
        (GPI_ADDR_START+02*ADDR_INC): readData = (I_PORT_COUNT >  2) ? in2   : OxDEC0DEE3;
        (GPI_ADDR_START+03*ADDR_INC): readData = (I_PORT_COUNT >  3) ? in3   : OxDEC0DEE3;
        (GPI_ADDR_START+04*ADDR_INC): readData = (I_PORT_COUNT >  4) ? in4   : OxDEC0DEE3;
        (GPI_ADDR_START+05*ADDR_INC): readData = (I_PORT_COUNT >  5) ? in5   : OxDEC0DEE3;
        (GPI_ADDR_START+06*ADDR_INC): readData = (I_PORT_COUNT >  6) ? in6   : OxDEC0DEE3;
        (GPI_ADDR_START+07*ADDR_INC): readData = (I_PORT_COUNT >  7) ? in7   : OxDEC0DEE3;
        (GPI_ADDR_START+08*ADDR_INC): readData = (I_PORT_COUNT >  8) ? in8   : OxDEC0DEE3;
        (GPI_ADDR_START+09*ADDR_INC): readData = (I_PORT_COUNT >  9) ? in9   : OxDEC0DEE3;
        (GPI_ADDR_START+10*ADDR_INC): readData = (I_PORT_COUNT > 10) ? in10  : OxDEC0DEE3;
        (GPI_ADDR_START+11*ADDR_INC): readData = (I_PORT_COUNT > 11) ? in11  : OxDEC0DEE3;
        (GPI_ADDR_START+12*ADDR_INC): readData = (I_PORT_COUNT > 12) ? in12  : OxDEC0DEE3;
        (GPI_ADDR_START+13*ADDR_INC): readData = (I_PORT_COUNT > 13) ? in13  : OxDEC0DEE3;
        (GPI_ADDR_START+14*ADDR_INC): readData = (I_PORT_COUNT > 14) ? in14  : OxDEC0DEE3;
        (GPI_ADDR_START+15*ADDR_INC): readData = (I_PORT_COUNT > 15) ? in15  : OxDEC0DEE3;
        (GPI_ADDR_START+16*ADDR_INC): readData = (I_PORT_COUNT > 16) ? in16  : OxDEC0DEE3;
        (GPI_ADDR_START+17*ADDR_INC): readData = (I_PORT_COUNT > 17) ? in17  : OxDEC0DEE3;
        (GPI_ADDR_START+18*ADDR_INC): readData = (I_PORT_COUNT > 18) ? in18  : OxDEC0DEE3;
        (GPI_ADDR_START+19*ADDR_INC): readData = (I_PORT_COUNT > 19) ? in19  : OxDEC0DEE3;
        (GPI_ADDR_START+20*ADDR_INC): readData = (I_PORT_COUNT > 20) ? in20  : OxDEC0DEE3;
        (GPI_ADDR_START+21*ADDR_INC): readData = (I_PORT_COUNT > 21) ? in21  : OxDEC0DEE3;
        (GPI_ADDR_START+22*ADDR_INC): readData = (I_PORT_COUNT > 22) ? in22  : OxDEC0DEE3;
        (GPI_ADDR_START+23*ADDR_INC): readData = (I_PORT_COUNT > 23) ? in23  : OxDEC0DEE3;
        (GPI_ADDR_START+24*ADDR_INC): readData = (I_PORT_COUNT > 24) ? in24  : OxDEC0DEE3;
        (GPI_ADDR_START+25*ADDR_INC): readData = (I_PORT_COUNT > 25) ? in25  : OxDEC0DEE3;
        (GPI_ADDR_START+26*ADDR_INC): readData = (I_PORT_COUNT > 26) ? in26  : OxDEC0DEE3;
        (GPI_ADDR_START+27*ADDR_INC): readData = (I_PORT_COUNT > 27) ? in27  : OxDEC0DEE3;
        (GPI_ADDR_START+28*ADDR_INC): readData = (I_PORT_COUNT > 28) ? in28  : OxDEC0DEE3;
        (GPI_ADDR_START+29*ADDR_INC): readData = (I_PORT_COUNT > 29) ? in29  : OxDEC0DEE3;
        (GPI_ADDR_START+30*ADDR_INC): readData = (I_PORT_COUNT > 30) ? in30  : OxDEC0DEE3;
        (GPI_ADDR_START+31*ADDR_INC): readData = (I_PORT_COUNT > 31) ? in31  : OxDEC0DEE3;
        (GPO_ADDR_START+00*ADDR_INC): readData = (O_PORT_COUNT >  0) ? out0  : OxDEC0DEE3;
        (GPO_ADDR_START+01*ADDR_INC): readData = (O_PORT_COUNT >  1) ? out1  : OxDEC0DEE3;
        (GPO_ADDR_START+02*ADDR_INC): readData = (O_PORT_COUNT >  2) ? out2  : OxDEC0DEE3;
        (GPO_ADDR_START+03*ADDR_INC): readData = (O_PORT_COUNT >  3) ? out3  : OxDEC0DEE3;
        (GPO_ADDR_START+04*ADDR_INC): readData = (O_PORT_COUNT >  4) ? out4  : OxDEC0DEE3;
        (GPO_ADDR_START+05*ADDR_INC): readData = (O_PORT_COUNT >  5) ? out5  : OxDEC0DEE3;
        (GPO_ADDR_START+06*ADDR_INC): readData = (O_PORT_COUNT >  6) ? out6  : OxDEC0DEE3;
        (GPO_ADDR_START+07*ADDR_INC): readData = (O_PORT_COUNT >  7) ? out7  : OxDEC0DEE3;
        (GPO_ADDR_START+08*ADDR_INC): readData = (O_PORT_COUNT >  8) ? out8  : OxDEC0DEE3;
        (GPO_ADDR_START+09*ADDR_INC): readData = (O_PORT_COUNT >  9) ? out9  : OxDEC0DEE3;
        (GPO_ADDR_START+10*ADDR_INC): readData = (O_PORT_COUNT > 10) ? out10 : OxDEC0DEE3;
        (GPO_ADDR_START+11*ADDR_INC): readData = (O_PORT_COUNT > 11) ? out11 : OxDEC0DEE3;
        (GPO_ADDR_START+12*ADDR_INC): readData = (O_PORT_COUNT > 12) ? out12 : OxDEC0DEE3;
        (GPO_ADDR_START+13*ADDR_INC): readData = (O_PORT_COUNT > 13) ? out13 : OxDEC0DEE3;
        (GPO_ADDR_START+14*ADDR_INC): readData = (O_PORT_COUNT > 14) ? out14 : OxDEC0DEE3;
        (GPO_ADDR_START+15*ADDR_INC): readData = (O_PORT_COUNT > 15) ? out15 : OxDEC0DEE3;
        (GPO_ADDR_START+16*ADDR_INC): readData = (O_PORT_COUNT > 16) ? out16 : OxDEC0DEE3;
        (GPO_ADDR_START+17*ADDR_INC): readData = (O_PORT_COUNT > 17) ? out17 : OxDEC0DEE3;
        (GPO_ADDR_START+18*ADDR_INC): readData = (O_PORT_COUNT > 18) ? out18 : OxDEC0DEE3;
        (GPO_ADDR_START+19*ADDR_INC): readData = (O_PORT_COUNT > 19) ? out19 : OxDEC0DEE3;
        (GPO_ADDR_START+20*ADDR_INC): readData = (O_PORT_COUNT > 20) ? out20 : OxDEC0DEE3;
        (GPO_ADDR_START+21*ADDR_INC): readData = (O_PORT_COUNT > 21) ? out21 : OxDEC0DEE3;
        (GPO_ADDR_START+22*ADDR_INC): readData = (O_PORT_COUNT > 22) ? out22 : OxDEC0DEE3;
        (GPO_ADDR_START+23*ADDR_INC): readData = (O_PORT_COUNT > 23) ? out23 : OxDEC0DEE3;
        (GPO_ADDR_START+24*ADDR_INC): readData = (O_PORT_COUNT > 24) ? out24 : OxDEC0DEE3;
        (GPO_ADDR_START+25*ADDR_INC): readData = (O_PORT_COUNT > 25) ? out25 : OxDEC0DEE3;
        (GPO_ADDR_START+26*ADDR_INC): readData = (O_PORT_COUNT > 26) ? out26 : OxDEC0DEE3;
        (GPO_ADDR_START+27*ADDR_INC): readData = (O_PORT_COUNT > 27) ? out27 : OxDEC0DEE3;
        (GPO_ADDR_START+28*ADDR_INC): readData = (O_PORT_COUNT > 28) ? out28 : OxDEC0DEE3;
        (GPO_ADDR_START+29*ADDR_INC): readData = (O_PORT_COUNT > 29) ? out29 : OxDEC0DEE3;
        (GPO_ADDR_START+30*ADDR_INC): readData = (O_PORT_COUNT > 30) ? out30 : OxDEC0DEE3;
        (GPO_ADDR_START+31*ADDR_INC): readData = (O_PORT_COUNT > 31) ? out31 : OxDEC0DEE3;
        default: readData = OxDEC0DEE3;
      endcase
    end

    //Output DataW
    always@(posedge s_axi_aclk) begin //everything inside generated by a script
      if(~s_axi_aresetn) begin
        if(O_PORT_COUNT > 0) begin
          out0 <= 0;
        end
        if(O_PORT_COUNT > 1) begin
          out1 <= 0;
        end
        if(O_PORT_COUNT > 2) begin
          out2 <= 0;
        end
        if(O_PORT_COUNT > 3) begin
          out3 <= 0;
        end
        if(O_PORT_COUNT > 4) begin
          out4 <= 0;
        end
        if(O_PORT_COUNT > 5) begin
          out5 <= 0;
        end
        if(O_PORT_COUNT > 6) begin
          out6 <= 0;
        end
        if(O_PORT_COUNT > 7) begin
          out7 <= 0;
        end
        if(O_PORT_COUNT > 8) begin
          out8 <= 0;
        end
        if(O_PORT_COUNT > 9) begin
          out9 <= 0;
        end
        if(O_PORT_COUNT > 10) begin
          out10 <= 0;
        end
        if(O_PORT_COUNT > 11) begin
          out11 <= 0;
        end
        if(O_PORT_COUNT > 12) begin
          out12 <= 0;
        end
        if(O_PORT_COUNT > 13) begin
          out13 <= 0;
        end
        if(O_PORT_COUNT > 14) begin
          out14 <= 0;
        end
        if(O_PORT_COUNT > 15) begin
          out15 <= 0;
        end
        if(O_PORT_COUNT > 16) begin
          out16 <= 0;
        end
        if(O_PORT_COUNT > 17) begin
          out17 <= 0;
        end
        if(O_PORT_COUNT > 18) begin
          out18 <= 0;
        end
        if(O_PORT_COUNT > 19) begin
          out19 <= 0;
        end
        if(O_PORT_COUNT > 20) begin
          out20 <= 0;
        end
        if(O_PORT_COUNT > 21) begin
          out21 <= 0;
        end
        if(O_PORT_COUNT > 22) begin
          out22 <= 0;
        end
        if(O_PORT_COUNT > 23) begin
          out23 <= 0;
        end
        if(O_PORT_COUNT > 24) begin
          out24 <= 0;
        end
        if(O_PORT_COUNT > 25) begin
          out25 <= 0;
        end
        if(O_PORT_COUNT > 26) begin
          out26 <= 0;
        end
        if(O_PORT_COUNT > 27) begin
          out27 <= 0;
        end
        if(O_PORT_COUNT > 28) begin
          out28 <= 0;
        end
        if(O_PORT_COUNT > 29) begin
          out29 <= 0;
        end
        if(O_PORT_COUNT > 30) begin
          out30 <= 0;
        end
        if(O_PORT_COUNT > 31) begin
          out31 <= 0;
        end
      end else case(s_axi_awaddr)
        (GPO_ADDR_START+0*ADDR_INC): begin
          if(O_PORT_COUNT > 0) begin
            out0 <= (write&s_axi_wready) ? s_axi_wdata : out0;
          end
        end
        (GPO_ADDR_START+1*ADDR_INC): begin
          if(O_PORT_COUNT > 1) begin
            out1 <= (write&s_axi_wready) ? s_axi_wdata : out1;
          end
        end
        (GPO_ADDR_START+2*ADDR_INC): begin
          if(O_PORT_COUNT > 2) begin
            out2 <= (write&s_axi_wready) ? s_axi_wdata : out2;
          end
        end
        (GPO_ADDR_START+3*ADDR_INC): begin
          if(O_PORT_COUNT > 3) begin
            out3 <= (write&s_axi_wready) ? s_axi_wdata : out3;
          end
        end
        (GPO_ADDR_START+4*ADDR_INC): begin
          if(O_PORT_COUNT > 4) begin
            out4 <= (write&s_axi_wready) ? s_axi_wdata : out4;
          end
        end
        (GPO_ADDR_START+5*ADDR_INC): begin
          if(O_PORT_COUNT > 5) begin
            out5 <= (write&s_axi_wready) ? s_axi_wdata : out5;
          end
        end
        (GPO_ADDR_START+6*ADDR_INC): begin
          if(O_PORT_COUNT > 6) begin
            out6 <= (write&s_axi_wready) ? s_axi_wdata : out6;
          end
        end
        (GPO_ADDR_START+7*ADDR_INC): begin
          if(O_PORT_COUNT > 7) begin
            out7 <= (write&s_axi_wready) ? s_axi_wdata : out7;
          end
        end
        (GPO_ADDR_START+8*ADDR_INC): begin
          if(O_PORT_COUNT > 8) begin
            out8 <= (write&s_axi_wready) ? s_axi_wdata : out8;
          end
        end
        (GPO_ADDR_START+9*ADDR_INC): begin
          if(O_PORT_COUNT > 9) begin
            out9 <= (write&s_axi_wready) ? s_axi_wdata : out9;
          end
        end
        (GPO_ADDR_START+10*ADDR_INC): begin
          if(O_PORT_COUNT > 10) begin
            out10 <= (write&s_axi_wready) ? s_axi_wdata : out10;
          end
        end
        (GPO_ADDR_START+11*ADDR_INC): begin
          if(O_PORT_COUNT > 11) begin
            out11 <= (write&s_axi_wready) ? s_axi_wdata : out11;
          end
        end
        (GPO_ADDR_START+12*ADDR_INC): begin
          if(O_PORT_COUNT > 12) begin
            out12 <= (write&s_axi_wready) ? s_axi_wdata : out12;
          end
        end
        (GPO_ADDR_START+13*ADDR_INC): begin
          if(O_PORT_COUNT > 13) begin
            out13 <= (write&s_axi_wready) ? s_axi_wdata : out13;
          end
        end
        (GPO_ADDR_START+14*ADDR_INC): begin
          if(O_PORT_COUNT > 14) begin
            out14 <= (write&s_axi_wready) ? s_axi_wdata : out14;
          end
        end
        (GPO_ADDR_START+15*ADDR_INC): begin
          if(O_PORT_COUNT > 15) begin
            out15 <= (write&s_axi_wready) ? s_axi_wdata : out15;
          end
        end
        (GPO_ADDR_START+16*ADDR_INC): begin
          if(O_PORT_COUNT > 16) begin
            out16 <= (write&s_axi_wready) ? s_axi_wdata : out16;
          end
        end
        (GPO_ADDR_START+17*ADDR_INC): begin
          if(O_PORT_COUNT > 17) begin
            out17 <= (write&s_axi_wready) ? s_axi_wdata : out17;
          end
        end
        (GPO_ADDR_START+18*ADDR_INC): begin
          if(O_PORT_COUNT > 18) begin
            out18 <= (write&s_axi_wready) ? s_axi_wdata : out18;
          end
        end
        (GPO_ADDR_START+19*ADDR_INC): begin
          if(O_PORT_COUNT > 19) begin
            out19 <= (write&s_axi_wready) ? s_axi_wdata : out19;
          end
        end
        (GPO_ADDR_START+20*ADDR_INC): begin
          if(O_PORT_COUNT > 20) begin
            out20 <= (write&s_axi_wready) ? s_axi_wdata : out20;
          end
        end
        (GPO_ADDR_START+21*ADDR_INC): begin
          if(O_PORT_COUNT > 21) begin
            out21 <= (write&s_axi_wready) ? s_axi_wdata : out21;
          end
        end
        (GPO_ADDR_START+22*ADDR_INC): begin
          if(O_PORT_COUNT > 22) begin
            out22 <= (write&s_axi_wready) ? s_axi_wdata : out22;
          end
        end
        (GPO_ADDR_START+23*ADDR_INC): begin
          if(O_PORT_COUNT > 23) begin
            out23 <= (write&s_axi_wready) ? s_axi_wdata : out23;
          end
        end
        (GPO_ADDR_START+24*ADDR_INC): begin
          if(O_PORT_COUNT > 24) begin
            out24 <= (write&s_axi_wready) ? s_axi_wdata : out24;
          end
        end
        (GPO_ADDR_START+25*ADDR_INC): begin
          if(O_PORT_COUNT > 25) begin
            out25 <= (write&s_axi_wready) ? s_axi_wdata : out25;
          end
        end
        (GPO_ADDR_START+26*ADDR_INC): begin
          if(O_PORT_COUNT > 26) begin
            out26 <= (write&s_axi_wready) ? s_axi_wdata : out26;
          end
        end
        (GPO_ADDR_START+27*ADDR_INC): begin
          if(O_PORT_COUNT > 27) begin
            out27 <= (write&s_axi_wready) ? s_axi_wdata : out27;
          end
        end
        (GPO_ADDR_START+28*ADDR_INC): begin
          if(O_PORT_COUNT > 28) begin
            out28 <= (write&s_axi_wready) ? s_axi_wdata : out28;
          end
        end
        (GPO_ADDR_START+29*ADDR_INC): begin
          if(O_PORT_COUNT > 29) begin
            out29 <= (write&s_axi_wready) ? s_axi_wdata : out29;
          end
        end
        (GPO_ADDR_START+30*ADDR_INC): begin
          if(O_PORT_COUNT > 30) begin
            out30 <= (write&s_axi_wready) ? s_axi_wdata : out30;
          end
        end
        (GPO_ADDR_START+31*ADDR_INC): begin
          if(O_PORT_COUNT > 31) begin
            out31 <= (write&s_axi_wready) ? s_axi_wdata : out31;
          end
        end
      endcase
    end

    //AXI Signals
    //Write response
    reg s_axi_bvalid_hold, s_axi_bresp_MSB_hold;
    assign s_axi_bvalid = write | s_axi_bvalid_hold;
    assign s_axi_bresp = (s_axi_bvalid_hold) ? {s_axi_bresp_MSB_hold, 1'b0} :
                            (writeAddrValid) ? RES_OKAY : RES_ERR;
    always@(posedge s_axi_aclk) begin
      if(~s_axi_aresetn) begin
        s_axi_bvalid_hold <= 0;
      end else case(s_axi_bvalid_hold)
        1'b0: s_axi_bvalid_hold <= ~s_axi_bready & s_axi_bvalid;
        1'b1: s_axi_bvalid_hold <= ~s_axi_bready;
      endcase
      if(~s_axi_bvalid_hold) begin
        s_axi_bresp_MSB_hold <= s_axi_bresp[1];
      end
    end

     //Read Channel handshake (Addr & data)
    reg s_axi_rvalid_hold;
    assign s_axi_arready = ~s_axi_rvalid_hold;
    assign s_axi_rvalid = s_axi_arvalid | s_axi_rvalid_hold;
    //This will hold read data channel stable until master accepts tx
    always@(posedge s_axi_aclk) begin
      if(~s_axi_aresetn) begin
        s_axi_rvalid_hold <= 0;
      end else case(s_axi_rvalid_hold)
        1'b0: s_axi_rvalid_hold <= ~s_axi_rready & s_axi_rvalid;
        1'b1: s_axi_rvalid_hold <= ~s_axi_rready;
      endcase
    end

    //Read response
    reg s_axi_rresp_MSB_hold;
    always@(posedge s_axi_aclk) begin
      if(~s_axi_rvalid_hold) begin
       s_axi_rresp_MSB_hold <= s_axi_rresp[1];
      end
    end
    assign s_axi_rresp = (s_axi_rvalid_hold) ? {s_axi_rresp_MSB_hold, 1'b0} :
                             (readAddrValid) ? RES_OKAY : RES_ERR;
    
    //Read data
    reg [C_S_AXI_DATA_WIDTH-1:0] s_axi_rdata_hold;
    always@(posedge s_axi_aclk) begin
      if(~s_axi_rvalid_hold) begin
        s_axi_rdata_hold <= s_axi_rdata;
      end
    end
    assign s_axi_rdata = (s_axi_rvalid_hold) ? s_axi_rdata_hold : readData;

    //Write Channel handshake (Data & Addr)
    assign s_axi_awready = ~s_axi_bvalid_hold & ~(s_axi_awvalid ^ s_axi_wvalid);
    assign s_axi_wready  = ~s_axi_bvalid_hold & ~(s_axi_awvalid ^ s_axi_wvalid);
  endmodule
