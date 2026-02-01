// File        :FIFO.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :01-02-206
// Module      :fifo
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This module implements a FIFO control logic that tracks full and empty conditions based on read and write operations.

module fifo(input clk,wr,rd, input [7:0] din,output logic full , empty);
  logic [7:0] mem[15:0];
  logic [4:0] cnt=0;
  assign full =(cnt==16);
  assign empty =(cnt==0);
  always_ff @(posedge clk) begin
  	if(wr&&!full)cnt++;
  	if(rd&&!empty)cnt--;
  end
endmodule 
