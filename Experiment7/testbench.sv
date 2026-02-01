// File        :tb_shift_register.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :01-02-2026
// Module      :tb
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :The testbench applies random serial input and updates a reference model to verify shifting behavior.
module tb;
  logic clk=0, si, so;
  siso dut(.*);
  always #5 clk=~clk;
  logic [3:0] q_ref;
  initial begin
    $dumpfile ("dump.vcd");
    $dumpvars;
    repeat (20) begin
      si=$urandom();
      q_ref ={q_ref[2:0] , si};
      @(posedge clk);
      #1;
    end
    $finish;
  end 
endmodule 
