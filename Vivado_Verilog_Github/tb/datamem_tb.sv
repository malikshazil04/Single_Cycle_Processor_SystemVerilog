`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2025 03:52:58 PM
// Design Name: 
// Module Name: datamem_tb
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
//=======================================================================
// Testbench for data_mem module
//=======================================================================


module tb_data_mem;

    // Parameters
    parameter DEPTH = 1024;

    // DUT signals
    logic        clk;
    logic        mem_read;
    logic        mem_write;
    logic [2:0]  funct3;
    logic [31:0] addr;
    logic [31:0] dataW;
    logic [31:0] dataR;

    // DUT instantiation
    data_mem #(.DEPTH(DEPTH)) dut (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .funct3(funct3),
        .addr(addr),
        .dataW(dataW),
        .dataR(dataR)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Test variable
        integer i;

        //==== File required for memory initialize ====
        // Optionally create/init data_mem.mem here if needed

        //==== Reset signals ====
        mem_read  = 0;
        mem_write = 0;
        funct3    = 0;
        addr      = 0;
        dataW     = 0;

        // Wait for some time
        #10;

        //==== Write: SW (Store Word) ====
        addr      = 32'h10;
        dataW     = 32'hAABBCCDD;
        funct3    = 3'b010;    // SW
        mem_write = 1;
        mem_read  = 0;
        #10;                   // one clock for write
        mem_write = 0;

        //==== Write: SH (Store Half) ====
        addr      = 32'h20;
        dataW     = 32'h0000BEEF;
        funct3    = 3'b001;    // SH
        mem_write = 1;
        #10;
        mem_write = 0;

        //==== Write: SB (Store Byte) ====
        addr      = 32'h30;
        dataW     = 32'h00000022;
        funct3    = 3'b000;    // SB
        mem_write = 1;
        #10;
        mem_write = 0;

        //=== Read: LW after SW ===
        addr      = 32'h10;
        funct3    = 3'b010;    // LW
        mem_read  = 1;
        #1;                    // allow combinational read
        $display("Read LW  @%h: Exp=AABBCCDD, Got=%h", addr, dataR);
        mem_read  = 0;

        //=== Read: LHU after SH ===
        addr      = 32'h20;
        funct3    = 3'b101;    // LHU
        mem_read  = 1;
        #1;
        $display("Read LHU @%h: Exp=0000BEEF, Got=%h", addr, dataR);
        mem_read  = 0;

        //=== Read: LB (should be 0x22) after SB ===
        addr      = 32'h30;
        funct3    = 3'b000;    // LB
        mem_read  = 1;
        #1;
        $display("Read LB  @%h: Exp=00000022, Got=%h", addr, dataR);
        mem_read  = 0;

        //=== Read: LBU (should be 0x22) after SB ===
        addr      = 32'h30;
        funct3    = 3'b100;    // LBU
        mem_read  = 1;
        #1;
        $display("Read LBU @%h: Exp=00000022, Got=%h", addr, dataR);
        mem_read  = 0;

        //=== Try unaligned accesses ===
        addr      = 32'h11;
        funct3    = 3'b000;    // LB
        mem_read  = 1;
        #1;
        $display("Read LB  (unaligned) @%h, Got=%h", addr, dataR);
        mem_read  = 0;

        //=== Fill more tests as needed ===

        // End simulation after all testcases
        #20;
        $display("TESTBENCH COMPLETED");
        $finish;
    end

endmodule



