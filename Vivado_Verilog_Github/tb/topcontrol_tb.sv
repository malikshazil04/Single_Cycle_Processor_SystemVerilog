`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 04:30:55 PM
// Design Name: 
// Module Name: topcontrol_tb
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

module top_control_alu_tb;

    logic [6:0] opcode;
    logic [2:0] funct3;
    logic       funct7;

    logic [3:0] alu_ctrl;
    logic regwrite, alusrc, memread, memwrite, memtoreg, branch;

    top_control_alu dut (
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .alu_ctrl(alu_ctrl),
        .regwrite(regwrite),
        .alusrc(alusrc),
        .memread(memread),
        .memwrite(memwrite),
        .memtoreg(memtoreg),
        .branch(branch)
    );

 
    initial begin
  
        opcode = 7'b0110011; funct3 = 3'b000; funct7 = 1'b0;
        #10;

        opcode = 7'b0010011; funct3 = 3'b000; funct7 = 1'b0;
        #10;

        opcode = 7'b0000011; funct3 = 3'b110; funct7 = 1'b0;
        #10;
  
        opcode = 7'b1100011; funct3 = 3'b100; funct7 = 1'b0;
        #10;

        opcode = 7'b1111111; funct3 = 3'b111; funct7 = 1'b1;
        #10;

        #10 $finish;
    end

endmodule

