// File        :traffic_light_controller.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :02-02-2026
// Module      :traffic
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This module implements a traffic light controller that cycles through RED, GREEN, and YELLOW states.The light resets to RED and then changes state on each clock cycle.
typedef enum {RED, GREEN,YELLOW} light_t;
module traffic(input clk, rst , output light_t color);
  always_ff @(posedge clk)begin
    if(rst) color<=RED;
    else case (color)
      RED: color <=GREEN;
      GREEN:color<=YELLOW;
      YELLOW: color <=RED;
    endcase
  end
endmodule 
    
