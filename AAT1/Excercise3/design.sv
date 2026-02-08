// File        :atm_controller.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :08-02-2026
// Module      :atm_fsm
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :The FSM moves through IDLE, CHECK_PIN, CHECK_BAL, and DISPENSE states based on user inputs.Cash is dispensed only when both PIN and balance are valid.



`timescale 1ns/1ps


module atm_fsm (
  input  logic clk,
  input  logic rst,
  input  logic card_inserted,
  input  logic pin_correct,
  input  logic balance_ok,
  output logic dispense_cash
);

  typedef enum logic [1:0] {
    IDLE,
    CHECK_PIN,
    CHECK_BAL,
    DISPENSE
  } state_t;

  state_t state, next_state;

 
  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      state <= IDLE;
    else
      state <= next_state;
  end

  
  always_comb begin
    next_state = state;
    dispense_cash = 0;

    case (state)
      IDLE:
        if (card_inserted)
          next_state = CHECK_PIN;

      CHECK_PIN:
        if (pin_correct)
          next_state = CHECK_BAL;
        else
          next_state = IDLE;

      CHECK_BAL:
        if (balance_ok)
          next_state = DISPENSE;
        else
          next_state = IDLE;

      DISPENSE: begin
        dispense_cash = 1;
        next_state = IDLE;
      end
    endcase
  end

  
  property p_dispense_condition;
    @(posedge clk)
    dispense_cash |-> (pin_correct && balance_ok);
  endproperty
  assert property(p_dispense_condition);

  // Return to IDLE after dispensing
  property p_return_idle;
    @(posedge clk)
    (state == DISPENSE) |=> (state == IDLE);
  endproperty
  assert property(p_return_idle);

endmodule


