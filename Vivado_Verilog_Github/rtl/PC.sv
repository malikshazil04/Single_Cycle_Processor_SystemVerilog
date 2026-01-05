`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2025 11:36:31 PM
// Design Name: 
// Module Name: PC
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

module PC #(parameter N = 32)
(
    input logic clk,
    input logic reset,
    input logic [N-1:0] pc_in,
    output logic [N-1:0] add
);
    always_ff@(posedge clk)
    begin
    if(reset == 1'b1)
        add <= 0;
    else
        add <= pc_in ;
    end
endmodule
