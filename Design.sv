`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:26:32 PM
// Design Name: 
// Module Name: sampler
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module sampler(input clk,
              input rstn,
              input sd,input u1,input u2,
               input u1s,u2s,u3s,
              output reg x,
               output reg y);
  always@(posedge clk) begin
    if(!rstn) begin
      x <= 0;
      y <= 0;
    end
    else begin
      x <= sd*u1s*u2s;
      y <= sd*u1s*u3s;
    end
  end

endmodule
