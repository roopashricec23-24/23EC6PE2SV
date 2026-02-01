// File        :tb_priority_enc.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :29-01-2026
// Module      :pri_en_tb
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This testbench verifies a 4-bit priority encoder by applying random input values.Functional coverage is used to ensure all priority cases and other input combinations are exercised.
module pri_en_tb;
  logic [3:0]in; logic [1:0]out; logic valid;
  pri_en dut(.*);
  covergroup cp_enc;
    cp_in: coverpoint in{
      bins b0={1};
      bins b1={2};
      bins b2={4};
      bins b3={8};
      bins others =default;
    }
  endgroup
  cp_enc cg = new();
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    repeat(50) begin
      in=$urandom_range(0,15);
    #5;
    cg.sample();
    end
    $display ("Full coverage = %0.2f %%" , cg.get_inst_coverage());
  end
endmodule

      
