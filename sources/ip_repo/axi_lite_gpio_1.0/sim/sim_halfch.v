`timescale 1 ns / 1 ps
/* ----------------------------------------- *
 * Title       : GPIO Testbench Half Channel *
 * Project     : Custom AXI Lite GPIO        *
 * ----------------------------------------- *
 * File        : sim_halfch.v                *
 * Author      : Yigit Suoglu                *
 * Last Edit   : 01/11/2021                  *
 * ----------------------------------------- *
 * Description : Custom AXI Lite GPIO sim    *
 *               with half of ch are used    *
 * ----------------------------------------- */

module tb_halfch();
  reg clk, nrst;
  //Generate clocks
  always begin
    clk = 1;
    forever #5 clk = ~clk;
  end
  //Send reset
  initial begin
    nrst <= 1;
    #3
    nrst <= 0;
    #10
    nrst <= 1;
  end
  reg[30*8:0] step = "init";
  integer i;

  wire s_axi_awready, s_axi_wready, s_axi_bvalid, s_axi_arready, s_axi_rvalid;
  wire [1:0] s_axi_bresp, s_axi_rresp;
  wire [31:0] s_axi_rdata;
  reg [31:0] s_axi_awaddr, s_axi_wdata, s_axi_araddr;
  reg [3:0]  s_axi_wstrb;
  reg s_axi_awvalid, s_axi_wvalid, s_axi_bready, s_axi_arvalid, s_axi_rready;
  

  axi_lite_gpio_v1_0 #(
    .I_PORT_COUNT(16),
    .O_PORT_COUNT(16)
  )uut(
    //AXI Bus
    .s_axi_aclk(clk),
    .s_axi_aresetn(nrst),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awprot(),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arprot(),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_rdata(s_axi_rdata), 
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    .in0(32'hCE00),
    .in1(32'hCE01),
    .in2(32'hCE02),
    .in3(32'hCE03),
    .in4(32'hCE04),
    .in5(32'hCE05),
    .in6(32'hCE06),
    .in7(32'hCE07),
    .in8(32'hCE08),
    .in9(32'hCE09),
    .in10(32'hCE10),
    .in11(32'hCE11),
    .in12(32'hCE12),
    .in13(32'hCE13),
    .in14(32'hCE14),
    .in15(32'hCE15)
  );

  initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0,tb);
  end

  initial begin
    s_axi_wstrb = 4'hF;
    s_axi_awaddr = uut.GPO_AXI_ADDR_OFFSET;
    s_axi_wdata = 32'hDEADBEEF;
    s_axi_araddr = uut.GPI_AXI_ADDR_OFFSET;
    s_axi_awvalid = 0;
    s_axi_wvalid = 0;
    s_axi_bready = 1;
    s_axi_arvalid = 0;
    s_axi_rready = 1;
    repeat(2) @(posedge clk); #1;
    step = "valid write & read";
    s_axi_awaddr = uut.GPO_AXI_ADDR_OFFSET;
    s_axi_wdata = 32'hBEEF0000;
    s_axi_araddr = uut.GPI_AXI_ADDR_OFFSET;
    for (i = 0; i < 18; i = i +1) begin
      s_axi_arvalid = 1;
      s_axi_wvalid = 1;
      s_axi_awvalid = 1;
      @(posedge clk); #1;
      fork
        begin
          while(s_axi_arready == 0) begin
            @(posedge clk); #1;
          end
          s_axi_arvalid = 0;
        end
        begin
          while(s_axi_awready == 0) begin
            @(posedge clk); #1;
          end
          s_axi_awvalid = 0;
        end
        begin
          while(s_axi_wready == 0) begin
            @(posedge clk); #1;
          end
          s_axi_wvalid = 0;
        end
      join
      repeat(2) @(posedge clk); #1;
      s_axi_awaddr = s_axi_awaddr + uut.ADDR_INC;
      s_axi_wdata = s_axi_wdata + 1;
      s_axi_araddr = s_axi_araddr + uut.ADDR_INC;
    end
    step = "finish";
    repeat(5) @(posedge clk); #1;
    $finish;
  end
endmodule
