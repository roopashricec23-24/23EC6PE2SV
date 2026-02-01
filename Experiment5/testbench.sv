// File        :tb_dff.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :01-02-2026
// Module      :tb_dff
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This testbench generates randomized d and rst signals using a packet class to test the D flip-flop.Functional coverage tracks combinations of reset and data values on each clock edge.
class packet;
  rand bit d, rst;
  constraint cl{rst dist{0:=90,1:=10};}
endclass
module tb_dff;
  logic clk=0 ,rst,d,q;
  dff dut(.*);
  always #5 clk=~clk;
  covergroup cg@(posedge clk);
    cross_rst_d: cross rst ,d;
  endgroup
  cg c_inst=new();
  packet pkt=new();
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    repeat(100) begin
      pkt.randomize();
      rst<=pkt.rst;d<=pkt.d;
      @(posedge clk);
    end
   	$display("Coverage:%0.2ff%%",c_inst.get_inst_coverage());
   	$finish;
   end
endmodule
             
  
