module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter a=0,b=1,c=2,d=3;
    reg [1:0] state, next_state;
    always @(posedge clk) begin
        if (~resetn) state <= a;
        else state <= next_state;
    end
    always @(*) begin
        g = 0;
        case(state)
            a: begin
                if (r[1]) next_state = b;
                else if (r[2]) next_state = c;
                else if (r[3]) next_state = d;
                else next_state = a;
                g = 0;
            end
            b: begin
                if (~r[1]) next_state = a;
                else next_state = b;
                g[1] = 1;
            end
            c: begin
                if (~r[2]) next_state = a;
                else next_state = c;
                g[2] = 1;
            end
            d: begin
                if (~r[3]) next_state = a;
                else next_state = d;
                g[3] = 1;
            end
        endcase
    end

endmodule
