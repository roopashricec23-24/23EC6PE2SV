// File        :ALU.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :29-01-2026
// Module      :alu_en
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This module implements an 8-bit ALU that performs operations like add, subtract, AND, and OR.The operation is selected using an enumerated opcode input.
typedef enum [1:0] {ADD,SUB,AND,OR} opcode_e;
module alu(input logic [7:0] a,b, input opcode_e op,output logic[7:0]y);
  always_comb case(op)
    ADD:y=a+b;
    SUB:y=a-b;
    AND:y=a&b;
    OR:y=a|b;
  endcase
endmodule
