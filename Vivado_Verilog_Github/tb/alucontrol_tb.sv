`timescale 1ns / 1ps

module alucontrol_tb;


    logic [1:0] op;
    logic [2:0] x;
    logic y;


    logic [3:0] out;


    alucontrol dut (
        .op(op),
        .x(x),
        .y(y),
        .out(out)
    );


    initial begin


  
        x = 3'b000; op = 2'b10; y = 1'b0;
        #10;
     

       
        x = 3'b000; op = 2'b10; y = 1'b1;
        #10;



        x = 3'b111; op = 2'b10; y = 1'b0;
        #10;



        x = 3'b110; op = 2'b10; y = 1'b0;
        #10;


   
        #10;
        $finish;
    end

endmodule

