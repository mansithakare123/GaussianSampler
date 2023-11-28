`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:29:37 PM
// Design Name: 
// Module Name: generator
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


class generator;
  mailbox drv_mbx;
  event drv_done;
  int num = 20;
  function new();
    this.drv_mbx = drv_mbx;
    this.drv_done = drv_done;
  endfunction
  task run();
    for(int i=0;i<num;i++) begin
      switch_item item = new;
      item.sd = 1+($urandom%1000)/1000.0;
      item.u1 = 0+($urandom%1000)/1000.0;
      item.u2 = 0+($urandom%1000)/1000.0;
      item.u1s = $sqrt(-2*$ln(item.u1));
      item.u2s = $cos(2*3.14*item.u2);
      item.u3s = $sin(2*3.14*item.u2);
      item.x = item.sd*item.u1s*item.u2s;
      item.y = item.sd*item.u1s*item.u3s;
      $display("T=%0t [Generator] Loop:%0d/%0d create next item",$time,i+1,num);
      drv_mbx.put(item);
      @(drv_done);
    end
    $display("T=%0t [Generator] Done generation of %0d items",$time,num);
  endtask
endclass