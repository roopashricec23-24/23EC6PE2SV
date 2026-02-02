// File        :tb_OOP_Polymerism.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :02-02-2026
// Module      :tb_OOP
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :Testbench verifies runtime polymorphism by calling the child method through a parent handle.
module tb;

  Packet p;
  BadPacket bad = new();

  bit clk = 0;
  bit [7:0] data_sig;   // signal for waveform

  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    p = bad;

    if (!p.randomize())
      $display("Randomization failed");

    data_sig = p.data;   // move class data to signal
    p.print();

    #20;
    $finish;
  end

endmodule
