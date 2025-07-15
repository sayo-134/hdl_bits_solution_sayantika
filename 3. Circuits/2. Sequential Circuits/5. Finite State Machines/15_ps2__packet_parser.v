module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
	
    parameter b1=0, b2=1, b3=2, b4=3; //, s2=2
    reg [1:0] state, next_state;
    reg count_ena;
    // State transition logic (combinational)
    always @(*) begin
        case (state)
            b1: begin 
                next_state = (in[3])? b2:b1;
                done=0;
            end
            b2: begin
                next_state = b3;
                done = 0;
            end
            b3: begin
                next_state = b4;
                done = 0;
            end
            b4: begin
                next_state = (in[3])? b2:b1;
                done = 1;
            end
        endcase
    end
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) state <= b1;
        else state <= next_state;
    end
endmodule
