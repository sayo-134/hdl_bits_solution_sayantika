module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    parameter a=0,b=1,c=2,d=3,e=4,f=5,g=6,h=7,i=9,j=10;
    reg [3:0] state, next_state;
    always @(posedge clk) begin
        if (reset) state <= a;
        else state <= next_state;
    end
    always @(*) begin
        shift_ena=0;counting=0;done=0;
        case(state)
            a: next_state = (data)? b:a;
            b: next_state = (data)? c:a;
            c: next_state = (~data)?d:c;
            d: next_state = (data)? e:a;
            e: begin
                next_state = f;
                shift_ena = 1;
            end
            f: begin
                next_state = g;
                shift_ena = 1;
            end
            g: begin
                next_state = h;
                shift_ena = 1;
            end
            h: begin
                next_state = i;
                shift_ena = 1;
            end
            i: begin
                next_state = (done_counting)? j:i;
                counting = 1;
            end
            j: begin
                next_state = (~ack)? j:a;
                done = 1;
            end
        endcase
    end
endmodule
