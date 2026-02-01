// File        :FSM.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :01-02-206
// Module      :fsm
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This module implements a 101 sequence detector FSM with state transitions controlled by clock and reset.
module fsm(input clk, rst ,in, output out );
  typedef enum {s0,s1,s2} state_t;
  state_t state ,next;
  always_ff @(posedge clk)
    state<=rst ? s0 : next;
endmodule 
