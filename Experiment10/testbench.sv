// File        :tb_traffic_light_controller.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :02-02-2026
// Module      :tb_traffic
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :Testbench verifies that the traffic light cycles through RED, GREEN, and YELLOW states correctly.
module tb;

  logic clk = 0, rst;
  light_t color;

  // Clock generation
  always #5 clk = ~clk;

  // DUT
  traffic dut (.clk(clk),.rst(rst),.color(color));

  // Coverage: check full traffic cycle
  covergroup cg_light_t @(posedge clk);
    cp_c : coverpoint color {
      bins cycle = (RED => GREEN => YELLOW => RED);
    }
  endgroup

  cg_light_t cg = new();

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    rst = 1;
    #10 rst = 0;

    repeat (10) @(posedge clk);

    $display("Coverage = %0.2f%%", cg.get_inst_coverage());
    $finish;
  end

endmodule
