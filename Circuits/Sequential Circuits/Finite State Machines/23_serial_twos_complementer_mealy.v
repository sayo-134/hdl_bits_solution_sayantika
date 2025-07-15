module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter s0=0,s1=1;
    reg state, next_state;
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= s0;
        else state <= next_state;
    end
    always @(*) begin
        case (state) 
            s0: begin
                next_state = (x)? s1:s0;
                z = x;
            end
            s1: begin
                next_state = s1;
                z = ~x;
            end
        endcase
    end

endmodule
