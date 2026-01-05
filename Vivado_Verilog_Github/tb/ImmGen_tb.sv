`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2025 06:38:49 PM
// Design Name: 
// Module Name: ImmGen_tb
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


module ImmGen_tb;

    logic [11:0] imm;
    logic [31:0] out;

    ImmGen uut (.imm(imm), .out(out));

    initial begin
        // Test 1: small positive value
        imm = 12'b000000000011;  // 3
        #5;
        $display("imm = %b, out = %b", imm, out);

        // Test 2: another positive value
        imm = 12'b000000000110;  // 6
        #5;
        $display("imm = %b, out = %b", imm, out);

        // Test 3: negative value (sign bit 1)
        imm = 12'b111111111100;  // -4
        #5;
        $display("imm = %b, out = %b", imm, out);

        $finish;
    end

endmodule

