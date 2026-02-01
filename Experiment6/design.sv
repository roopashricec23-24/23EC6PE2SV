// File        :counter.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :01-02-206
// Module      :count
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This module implements a 4-bit counter that increments on each clock cycle and resets to zero when rst is high.
module count(input clk,rst ,output logic [3:0] cnt);
  always_ff @(posedge clk)
    if( rst ) cnt<=0;
  else cnt<=cnt+1;
endmodule 
