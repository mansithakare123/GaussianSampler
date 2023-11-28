`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:30:49 PM
// Design Name: 
// Module Name: driver
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


class driver;
  virtual switch_if vif;
  event drv_done;
  mailbox drv_mbx;
  function new();
    this.vif = vif;
    this.drv_done = drv_done;
    this.drv_mbx = drv_mbx;
  endfunction
  task run();
    $display("T=%0t [Driver] starting",$time);
    @(posedge vif.clk);
    forever begin
      switch_item item;
      $display("T=%0t [Driver] waiting for item",$time);
      drv_mbx.get(item);
      item.print();
      vif.sd <= item.sd;
      vif.u1 <= item.u1;
      vif.u2 <= item.u2;
      vif.u1s <= item.u1s;
      vif.u2s <= item.u2s;
      vif.u3s <= item.u3s;
      vif.x <= item.x;
      vif.y <= item.y;
      ->drv_done;
      
    end
  endtask
endclass
