`timescale 1ns / 1ps

module tb_fsm_traffic;

    reg clk;
    reg rst_n;
    wire [1:0] light;

    fsm_traffic uut (
        .clk(clk),
        .rst_n(rst_n),
        .light(light)
    );

    // 10ns 주기 클럭 생성
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_fsm_traffic);

        clk = 0;
        rst_n = 0; // 초기 리셋
        #15 rst_n = 1; // 리셋 해제

        #150 $finish; // 150ns 동안 시뮬레이션
    end

endmodule