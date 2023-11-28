`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:24:22 PM
// Design Name: 
// Module Name: testbench
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

`include "interface.sv"
`include "test.sv"
module testbench;
  reg clk;
  always #5 clk = ~clk;
  switch_if _if(clk);
  sampler u0(.clk(clk),
            .rstn(_if.rstn),
            .sd(_if.sd),
            .u1(_if.u1),
             .u2(_if.u2),
            .u1s(_if.u1s),
            .u2s(_if.u2s),
            .u3s(_if.u3s),
            .x(_if.x),
            .y(_if.y));
  test t0;
  initial begin 
    clk <= 0;
    _if.rstn <= 0;
    #20 _if.rstn <= 1;
    t0 = new;
     t0.e0.vif = _if;
    t0.run();
    #100 $finish;
  end
    initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
endmodule
