// File        :tb_vending_machine.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :02-02-2026
// Module      :tb_vending
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :Testbench randomizes coin inputs and checks vending machine state transitions using coverage.
module tb;

  logic clk = 0, rst;
  logic [4:0] coin;
  logic dispense;

  // Clock generation
  always #5 clk = ~clk;

  // DUT
  vending dut (
    .clk(clk),
    .rst(rst),
    .coin(coin),
    .dispense(dispense)
  );

  // Coverage for FSM states
  covergroup cg_vend @(posedge clk);
    cp_st : coverpoint dut.state;
  endgroup

  cg_vend cg = new();

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    rst = 1;
    #10 rst = 0;

    repeat (20) begin
      coin = ($urandom % 2) ? 5 : 10; // random coin input
      @(posedge clk);
    end

    $display("Coverage = %0.2f%%", cg.get_inst_coverage());
    $finish;
  end

endmodule
