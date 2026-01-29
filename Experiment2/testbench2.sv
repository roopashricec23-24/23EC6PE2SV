/ File        :tb_mux2to1.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :28-01-2026
// Module      :tb_mux2to1
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This testbench uses a randomized transaction class to generate inputs and verify the 2:1 mux functionality.It also includes functional coverage on the select line sel and performs a self-check to detect mismatches.
class Transaction;
  rand bit[7:0] a,b;
  rand bit sel;
endclass
module tb_mux2to1;
  logic [7:0] a,b,y;
  logic sel;
  mux2to1 dut(.*);
  covergroup cg_mux;
    cp_sel: coverpoint sel;
  endgroup
  cg_mux cg=new();
  Transaction tr=new();
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    repeat(20)begin
      tr.randomize();
      a=tr.a;
      b=tr.b;
      sel=tr.sel;
      #5;
      cg.sample();
      if(y!==(sel?b:a)) $error("Mismatch!");
    end
    $display("Coverage=%0.2f%%",cg.get_inst_coverage());
  end
endmodule

