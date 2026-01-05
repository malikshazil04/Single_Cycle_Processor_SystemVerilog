`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2025 02:57:06 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
    parameter N =16;
    logic [N-1:0] A, B;
    logic [N-1:0] result;
    logic [1:0] opcode;
    
    ALU #(.N(N)) dut (.A(A) , .B(B) , .opcode(opcode), .result(result));
    
    initial
    begin
        A = 16'b0000000000000010; 
        B = 16'b0000000000000001;
        opcode = 2'b00; 
        #10;
        A = 16'b0000000000000010; 
        B = 16'b0000000000000001;
        opcode = 2'b01; 
        #10;

        A = 16'b0000000000000010; 
        B = 16'b0000000000000001;
        opcode = 2'b10; 
        #10;
        A = 16'b0000000000000010; 
        B = 16'b0000000000000001;
        opcode = 2'b11; 
        #10;
        
     $finish;
     end   
endmodule
