// File        :tb_calculater.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :08-02-2026
// Module      :tb_alu
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :The testbench randomizes input transactions and applies them to the ALU for verification.Coverage is collected to ensure all opcodes, including MUL, are sufficiently tested.

module tb;

  logic [31:0] a, b;
  opcode_t op;
  logic [31:0] result;

  alu dut(a, b, op, result);

  transaction tr;

  //---------------------------------------
  // COVERAGE
  //---------------------------------------
  covergroup cg;
    coverpoint op {
      bins add = {ADD};
      bins sub = {SUB};
      bins mul = {MUL};
      bins xor_op = {XOR};
    }
  endgroup

  cg cov = new();

  //---------------------------------------
  // TEST
  //---------------------------------------
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
            
    tr = new();

    repeat (100) begin
      assert(tr.randomize());

      a = tr.a;
      b = tr.b;
      op = tr.op;

      #1;
      cov.sample();

      $display("A=%0d B=%0d OP=%0d RESULT=%0d",
                a, b, op, result);
    end

    $display("Coverage = %0.2f %%", cov.get_coverage());
    $finish;
  end

endmodule
