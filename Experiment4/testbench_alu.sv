// File        :tb_ALU.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :29-01-2026
// Module      :alu_tb
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This testbench applies random inputs and operations to the ALU.It uses functional coverage to ensure all ALU operations are tested.
module tb_alu;
  logic [7:0]a,b,y;
  opcode_e op;
  alu dut (.*);
  covergroup cg_alu;
    cp_op: coverpoint op;
  endgroup
  cg_alu cg=new();
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    repeat(50) begin
      a=$urandom();
      b=$urandom();
      op=opcode_e '($urandom_range(0,3));
      #5;
      cg.sample;
    end
    $display("full coverage =%02.f %%", cg.get_inst_coverage());
  end
endmodule
