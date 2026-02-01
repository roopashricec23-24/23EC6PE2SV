// File        :priority_enc.sv
// Author      :Roopashri.C /1BM23EC218
// Created     :29-01-2026
// Module      :pri_en
// Project     :SystemVerilog & Verification(23EC6PE2SV)
// Faculty     :Prof.Ajaykumar Devarapalli
// Description :This code converts a 4-bit input into a 2-bit output based on priority.The valid signal becomes high when any input bit is 1.
module pri_en(input logic [3:0]in,output logic[1:0]out,output logic valid);
  always_comb begin
    valid=1;
    if(in[3]) out=2'b11;
    else if (in[2]) out=2'b10;
    else if (in[1]) out=2'b01;
    else if (in[0]) out=2'b00;
    else begin out=2'b00;
      valid =0; end
  end
endmodule
