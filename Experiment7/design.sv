/ File        :shift_register.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :01-02-206
// Module      :siso
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This module implements a 4-bit Serial-In Serial-Out (SISO) shift register.
module siso(input clk, si, output so);
  logic[3:0] q;
  assign so=q[3];
  always_ff @(posedge clk) q<={q[2:0],si};
endmodule 
