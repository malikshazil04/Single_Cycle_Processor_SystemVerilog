`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2025 11:43:28 PM
// Design Name: 
// Module Name: PC_tb
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


module PC_tb;
    parameter N =2;
    logic clk;
    logic reset;
    logic [N-1:0] add;
    
    PC #(
    .N(N)
    ) 
    dut(
    .clk(clk),
    .reset(reset),
    .add(add)
    );
    
     always
     begin
     #5
     clk = ~clk;
     end
     
     initial 
     begin
        clk   = 0;
        reset = 1;  
        #10;
        reset = 0;  
        #50;      
     $stop;
     end
endmodule
