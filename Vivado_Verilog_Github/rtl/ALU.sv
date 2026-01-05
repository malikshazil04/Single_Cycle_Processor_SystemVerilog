`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2025 02:47:45 PM
// Design Name: 
// Module Name: ALU
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

module ALU #(
    parameter WIDTH = 32
)(
    input  logic [WIDTH-1:0] A,
    input  logic [WIDTH-1:0] B,
    input  logic [3:0] opcode,   
    output logic [WIDTH-1:0] result,
    output logic zeroFlag
);
    always_comb begin
case(opcode)
    4'b0000:
        result = A + B;
    4'b0001:
        result = A - B;
    4'b0010:
        result = A & B;
    4'b0011:
        result = A | B;
    4'b0100:
        result = A ^ B;
    4'b0101:
        result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
    4'b0110:
        result = (A < B) ? 32'd1 : 32'd0;
    4'b0111:
        result = A << B[4:0];
    4'b1000:
        result = A >> B[4:0];
    4'b1001:
        result = $signed(A) >>> B[4:0];
    default:
        result = 32'd0;
endcase
 end
        assign zeroFlag = (result == 32'b0);
endmodule

