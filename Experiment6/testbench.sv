// File        :tb_counter.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :01-02-2026
// Module      :tb_count
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :The testbench checks counter operation and verifies rollover from 15 back to 0 using coverage.
module tb_count;
  logic clk=0,rst;
  logic [3:0] cnt;
  count dut(.*);
  always #5 clk=~clk;
  covergroup cg_cnt @(posedge clk);
    cp_val: coverpoint cnt{
      bins zero ={0};
      bins max ={15};
      bins roll =(15=>0);
    }
  endgroup
  cg_cnt cg=new();
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    rst=1;
    #20;rst =0;
    repeat(40) @(posedge clk);
    $display("Rollover hit? %0.2f%%",cg.get_inst_coverage());
    $finish;
  end
endmodule

  
