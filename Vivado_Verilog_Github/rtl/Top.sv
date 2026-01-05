`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 02:30:28 PM
// Design Name: 
// Module Name: Top
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

module Top#(
    parameter A = 32,   
    parameter B = 182,
    parameter E = 32,  
    parameter D = 8,
    parameter NUM_REG = 32,
    parameter G = 5,
    parameter H = 32,
    parameter I = 7
)(
    input  logic clk,
    input  logic reset
);

    logic [A-1:0] pc_out , pc_in;
    logic [E-1:0] instruction;
    logic [G-1:0] rsadd1, rsadd2, rdadd;
    logic [I-1:0] opcode;
    logic [E-1:0] wdata, reg_result1, reg_result2, alu_result , mux_res , imm_res , memresult;
    logic [2:0] func3;
    logic [6:0] func7;
    logic [3:0] op;
    logic we, aluSrc, memwrite, memread, memtoreg, branch, zeroFlag ,branch_taken;
    logic [A-1:0] add1 , add2 , shift;
   

    PC pc_inst (
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .add(pc_out)
    );


    InsMemory #(B, E, D) insmemory_inst (
        .addr(pc_out),
        .dataR(instruction)
    );
    
    Decoder decoder_inst (
    .instruction(instruction),
    .opcode(opcode),
    .rdadd(rdadd),
    .func3(func3),
    .rsadd1(rsadd1),
    .rsadd2(rsadd2),
    .func7(func7)
    );

    top_control_alu control_unit (
        .opcode(opcode),
        .funct3(func3),
        .funct7(func7[5]),
        .alu_ctrl(op),
        .regwrite(we),
        .alusrc(aluSrc),
        .memread(memread),
        .memwrite(memwrite),
        .memtoreg(memtoreg),
        .branch(branch)
    
    );
    Reg_file #(E, NUM_REG, G) regfile_inst (
        .clk(clk), 
        .we(we), 
        .rs1(rsadd1), 
        .rs2(rsadd2), 
        .rsw(rdadd), 
        .dataw(wdata), 
        .data1(reg_result1), 
        .data2(reg_result2)
    );
    ImmGen imm_inst (
        .instr(instruction),
        .imm(imm_res)
    );
    
    mux mux_inst (
        .ri(reg_result2),
        .li(imm_res),
        .sl(aluSrc),
        .res(mux_res)
     );
   
    ALU #(H) alu_inst(
        .A(reg_result1),
        .B(mux_res),
        .opcode(op),
        .result(alu_result),
        .zeroFlag(zeroFlag)     
    );
    
    data_mem #(1024) datamem_inst (
    .clk(clk),
    .mem_read(memread),
    .mem_write(memwrite),
    .funct3(func3),         
    .addr(alu_result),
    .dataW(reg_result2),
    .dataR(memresult)
    );

    mux wb_mux (
    .ri(alu_result), 
    .li(memresult), 
    .sl(memtoreg), 
    .res(wdata)
    
    );
    assign shift = imm_res << 1;
    assign add1 = pc_out + 4;
    assign add2 = shift + pc_out;

    BranchUnit bu(
    .branch(branch),
    .func3(func3),
    .zeroFlag(zeroFlag),
    .alu_result(alu_result),
    .branch_taken(branch_taken)
);
    mux branch_mux (
    .ri(add1), 
    .li(add2), 
    .sl(branch_taken), 
    .res(pc_in)
);  
endmodule


