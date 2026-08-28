`timescale 1ns / 1ps

module tb_and_gate;

    // 입력 신호는 reg, 출력 신호는 wire로 선언
    reg a;
    reg b;
    wire y;

    // 우리가 만든 AND 게이트 모듈 불러오기 (DUT: Design Under Test)
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // 시뮬레이션 파형 저장 설정
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_and_gate);

        // 테스트 신호 입력 세트 (0,0 -> 0,1 -> 1,0 -> 1,1)
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish; // 시뮬레이션 종료
    end

endmodule