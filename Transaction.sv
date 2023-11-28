`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:28:38 PM
// Design Name: 
// Module Name: Transaction
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


class switch_item;
  real sd;
  real u1;
  real u2;
  real u1s;
  real u2s;
  real u3s;
  real x;
  real y;
  
  function void print();
    $display("T=%0t  sd=%2.3f u1=%2.3f u2=%2.3f x=%2.3f y=%2.3f",$time,sd,u1,u2,x,y);
  endfunction
endclass
