// File        :mux2to1.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :29-01-2026
// Module      :mux2to1
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :The module performs data selection between inputs a and b.Output y reflects b when sel is high, else it reflects a.

module mux2to1(input logic[7:0]a,b,input logic sel, output logic [7:0] y);
  assign y=sel?b:a;
endmodule
