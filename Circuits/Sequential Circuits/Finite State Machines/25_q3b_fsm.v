module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter s0=0, s1=1, s2=2, s3=3, s4=4;
    reg [2:0] state, next_state;
    always @(posedge clk) begin
        if (reset) state <= s0;
        else state <= next_state;
    end
    always @(*) begin
        case (state)
            s0: next_state = (x)? s1:s0;
            s1: next_state = (x)? s4:s1;
            s2: next_state = (x)? s1:s2;
            s3: next_state = (x)? s2:s1;
            s4: next_state = (x)? s4:s3;
        endcase
    end
    assign z = (state==s3)||(state==s4);
endmodule
