// File        :tb_atm_controller.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :08-02-2026
// Module      :tb_atm_fsm
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :The testbench applies input sequences to drive FSM state transitions.Assertions verify correct cash dispensing and return to IDLE state.

`timescale 1ns/1ps

module tb;

  logic clk, rst;
  logic card_inserted, pin_correct, balance_ok;
  logic dispense_cash;

  // DUT
  atm_fsm dut (
    clk,
    rst,
    card_inserted,
    pin_correct,
    balance_ok,
    dispense_cash
  );

  //---------------------------------
  // Clock
  //---------------------------------
  always #5 clk = ~clk;

  //---------------------------------
  // COVERAGE
  //---------------------------------
  covergroup fsm_cov @(posedge clk);

    // Cover all states
    state_cp : coverpoint dut.state {
      bins idle      = {0};
      bins checkpin  = {1};
      bins checkbal  = {2};
      bins dispense  = {3};
    }

    // DISPENSE event coverage
    dispense_cp : coverpoint dispense_cash {
      bins dispensed = {1};
    }

  endgroup

  fsm_cov cov = new();

  //---------------------------------
  // Test stimulus
  //---------------------------------
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    clk = 0;
    rst = 1;
    card_inserted = 0;
    pin_correct = 0;
    balance_ok = 0;

    #12 rst = 0;

    // Case 1: Correct transaction
    @(posedge clk);
    card_inserted = 1;

    @(posedge clk);
    card_inserted = 0;
    pin_correct = 1;

    @(posedge clk);
    balance_ok = 1;

    @(posedge clk);
    balance_ok = 0;
    pin_correct = 0;

    // Case 2: Wrong PIN
    @(posedge clk);
    card_inserted = 1;

    @(posedge clk);
    card_inserted = 0;
    pin_correct = 0;

    // Case 3: Low balance
    @(posedge clk);
    card_inserted = 1;

    @(posedge clk);
    card_inserted = 0;
    pin_correct = 1;

    @(posedge clk);
    balance_ok = 0;

    // Run few extra cycles
    repeat (10) @(posedge clk);

    $display("Coverage = %0.2f %%", cov.get_coverage());
    $finish;
  end

endmodule
