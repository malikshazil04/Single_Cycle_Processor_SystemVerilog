`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 03:21:03 PM
// Design Name: 
// Module Name: controlunit_tb
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


module controlunit_tb;
    logic [6:0]opcode;
    logic regwrite;
    logic alusrc;
    logic memread;
    logic memwrite;
    logic memtoreg;
    logic branch;
    logic [1:0] aluop;
    
    control_unit dut(
    .opcode(opcode),
    .regwrite(regwrite),
    .alusrc(alusrc),
    .memread(memread),
    .memwrite(memwrite),
    .memtoreg(memtoreg),
    .branch(branch),
    .aluop(aluop));
    
    initial 
    begin
    #5
    opcode = 7'b0000011;
    #5
    opcode = 7'b0110011;
    #5
    opcode =  7'b0000011;
    #5
    opcode = 7'b0100011;
    #5
    opcode = 7'b1100011;
    #5
    $finish;
    end
    
endmodule
