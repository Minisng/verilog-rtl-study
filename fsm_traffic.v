module fsm_traffic (
    input wire clk,
    input wire rst_n,
    output reg [1:0] light // 00: RED, 01: GREEN, 10: YELLOW
);

    // 상태를 이진수로 정의 (Parameters)
    parameter RED    = 2'b00;
    parameter GREEN  = 2'b01;
    parameter YELLOW = 2'b10;

    // 현재 상태와 다음 상태를 저장할 레지스터
    reg [1:0] current_state, next_state;

    // [1] State Register: 클럭에 맞춰 현재 상태 업데이트
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= RED; // 리셋 시 RED 상태로 초기화
        end else begin
            current_state <= next_state;
        end
    end

    // [2] Next State Logic: 현재 상태에 따라 다음 상태 결정
    always @(*) begin
        case (current_state)
            RED:    next_state = GREEN;
            GREEN:  next_state = YELLOW;
            YELLOW: next_state = RED;
            default: next_state = RED;
        endcase
    end

    // [3] Output Logic: 현재 상태를 출력 신호로 연결
    always @(*) begin
        light = current_state;
    end

endmodule