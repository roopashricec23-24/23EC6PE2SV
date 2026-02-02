// File        :vending_machine.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :02-02-2026
// Module      :vending
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :FSM tracks inserted coins and dispenses an item when total value reaches 15 cents.
module vending (
  input  logic clk, rst,
  input  logic [4:0] coin,   // coin value: 0 or 5
  output logic dispense
);

  typedef enum logic [1:0] {IDLE, HAS5, HAS10} statet;
  statet state, next;

  // State update
  always_ff @(posedge clk) begin
    if (rst)
      state <= IDLE;
    else
      state <= next;
  end

  // Next-state and output logic
  always_comb begin
    dispense = 0;
    next = state;

    case (state)
      IDLE:  if (coin == 5)  next = HAS5;

      HAS5:  if (coin == 5)  next = HAS10;

      HAS10: begin
        if (coin == 5) begin
          dispense = 1;  // total 15
          next = IDLE;
        end
      end
    endcase
  end

endmodule
