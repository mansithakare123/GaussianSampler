`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:31:54 PM
// Design Name: 
// Module Name: environment
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


`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"

class env;
  driver d0;
  generator g0;
  mailbox drv_mbx;
  event drv_done;
  virtual switch_if vif;
  function new();
    d0 = new;
    g0 = new;
    drv_mbx = new();
    d0.drv_mbx = drv_mbx;
    g0.drv_mbx = drv_mbx;
    d0.drv_done = drv_done;
    g0.drv_done = drv_done;
  endfunction
  virtual task run();
    d0.vif = vif;
    fork 
      d0.run();
      g0.run();
    join_any
  endtask
endclass
