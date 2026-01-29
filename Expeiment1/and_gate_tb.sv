// File        :tb_and_gate.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :28-01-2026
// Module      :tb_and_gate
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :Simple testbench for and_gate.Randomizes inputs and uses a covergroup to measure input combination coverage
module tb_and_gate;
logic a, b, y;
and_gate dut ( .* );
  covergroup cg_and;
  cp_a: coverpoint a;
  cp_b: coverpoint b;
  cross_ab: cross cp_a, cp_b;
  endgroup
  cg_and cg=new();
  initial begin
  	 $dumpfile("dump.vcd");
  	 $dumpvars;
    repeat(20) begin
  	 a=$urandom();
  	 b=$urandom();
  	 #5;
     cg.sample();
  	 end
  	 $display("Full Coverage =%0.2f%%",cg. get_inst_coverage());
  end
endmodule
