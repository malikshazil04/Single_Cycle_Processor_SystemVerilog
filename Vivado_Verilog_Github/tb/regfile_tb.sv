`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2025 03:46:56 PM
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb;
    parameter DATA_WIDTH = 16;
    parameter NUM_REGS   = 4;
    parameter e =2;
    logic clk;
    logic we;
    logic [e-1:0]rsadd1;
    logic [e-1:0]rsadd2;
    logic [e-1:0]rdadd;
    logic [DATA_WIDTH-1:0]wdata;
    logic [DATA_WIDTH-1:0]result1;
    logic [DATA_WIDTH-1:0]result2;
    
    Reg_file #(
    .DATA_WIDTH(DATA_WIDTH),
    .NUM_REGS(NUM_REGS), 
     .e(e)
     ) 
     dut (
     .clk(clk), 
     .we(we) , 
     .rsadd1(rsadd1), 
     .rsadd2(rsadd2) , 
     .rdadd(rdadd) , 
     .wdata(wdata) , 
     .result1(result1) , 
     .result2(result2)
     ); 
     
     always
     begin
     #5
     clk = ~clk;
     end
    
     initial 
     begin
        clk = 0;
        we = 0;
        rdadd = 0;
        wdata = 0;
        rsadd1 = 0;
        rsadd2 = 0;
        #10;
        
        rsadd1 = 0;
        rsadd2 = 1;  
        #10;
        
        we = 1; 
        rdadd = 2; 
        wdata = 16'b0000000000000001;
        #10;
        we = 0;
        
        rsadd1 = 2;
        rsadd2 = 3;
        #10;

        $stop;
        end    
endmodule
