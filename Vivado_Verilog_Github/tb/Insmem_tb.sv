`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2025 11:00:41 PM
// Design Name: 
// Module Name: Insmem_tb
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

module Insmem_tb;
    parameter length = 76;
    parameter width  = 32;
    parameter N = 8;
    
    logic [width-1:0] add;
    logic [width-1:0] Ins;
    
    InsMemory #(
        .length(length), 
        .width(width),
        .N(N)
    ) dut (
        .add(add),
        .Ins(Ins)
    );
    
    initial begin
        add = 0;
        #5; 
        add = 1;
        #5;
        add = 2;
        #5;
        add = 3;
        #5;
        $stop;
    end
endmodule
