`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2025 04:21:49 PM
// Design Name: 
// Module Name: mux2X1
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


module mux(
    input logic [31:0] ri,
    input logic [31:0] li,
    input logic sl,
    output logic[31:0] res
    );
    always_comb
     begin
    if(sl == 1'b0)
       res = ri;
    else
        res = li;     
    end
endmodule
