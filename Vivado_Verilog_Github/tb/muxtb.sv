`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2025 04:30:03 PM
// Design Name: 
// Module Name: muxtb
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


module mux_tb;

    logic [31:0] ri;
    logic [31:0] li;
    logic sl;
    logic [31:0] res;

    // Instantiate the mux module
    mux uut (
        .ri(ri),
        .li(li),
        .sl(sl),
        .res(res)
    );

    initial begin
        // Display header


        // Test case 1
        ri = 32'h00000005;
        li = 32'h0000000A;
        sl = 1'b0;
        #10;


        // Test case 2
        sl = 1'b1;
        #10;


        // Test case 3
        ri = 32'hFFFFFFFF;
        li = 32'h00000000;
        sl = 1'b0;
        #10;

        // Test case 4
        sl = 1'b1;
        #10;
  

        $finish;
    end

endmodule

