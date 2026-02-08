// File        :digital_clock.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :08-02-2026
// Module      :sec_min_counter
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :The counter increments seconds from 0 to 59 and resets to 0 after reaching 59.When seconds roll over, the minute counter increments from 0 to 59.
module sec_min_counter (
  input  logic clk,
  input  logic rst,
  output logic [5:0] sec,
  output logic [5:0] min
);

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      sec <= 0;
      min <= 0;
    end
    else begin
      if (sec == 59) begin
        sec <= 0;

        if (min == 59)
          min <= 0;
        else
          min <= min + 1;
      end
      else begin
        sec <= sec + 1;
      end
    end
  end

endmodule
