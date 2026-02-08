// File        :calculater.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :08-02-2026
// Module      :alu
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :The ALU performs arithmetic and logical operations (ADD, SUB, MUL, XOR) based on the opcode input.It takes two operands and produces the computed result combinationally.
`timescale 1ns/1ps

//-----------------------------------------
// ENUM for operations
//-----------------------------------------
typedef enum logic [1:0] {
  ADD = 2'b00,
  SUB = 2'b01,
  MUL = 2'b10,
  XOR = 2'b11
} opcode_t;


//-----------------------------------------
// ALU DESIGN
//-----------------------------------------
module alu (
  input  logic [31:0] a,
  input  logic [31:0] b,
  input  opcode_t op,
  output logic [31:0] result
);

  always_comb begin
    case(op)
      ADD: result = a + b;
      SUB: result = a - b;
      MUL: result = a * b;
      XOR: result = a ^ b;
      default: result = 0;
    endcase
  end

endmodule


//-----------------------------------------
// TRANSACTION CLASS
//-----------------------------------------
class transaction;

  rand logic [31:0] a, b;
  rand opcode_t op;

  // MUL at least 20% probability
  constraint op_dist {
    op dist {ADD := 3,
             SUB := 3,
             XOR := 3,
             MUL := 3};   // equal or more than 20%
  }

endclass


