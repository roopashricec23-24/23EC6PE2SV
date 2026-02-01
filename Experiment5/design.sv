// File        :dff.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :01-02-206
// Module      :dff
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This module implements a D flip-flop with asynchronous reset.Output q stores input d on each clock edge and resets to 0 when rst is high
module dff(input clk,rst,d,output reg q);
  always_ff@(posedge clk or posedge rst)
    if(rst) q<=0; else q<=d;
endmodule
