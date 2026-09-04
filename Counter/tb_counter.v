`timescale 1ns / 1ps

module tb_counter;
    reg clk;
    reg rst_n;
    wire [3:0] count;

    counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_counter);
        clk = 0;
        rst_n = 0;
        #15 rst_n = 1;
        #200 $finish;
    end
endmodule
