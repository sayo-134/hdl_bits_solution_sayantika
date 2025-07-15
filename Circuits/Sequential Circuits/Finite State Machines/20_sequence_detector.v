module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    parameter s0=0,s1=1,s2=2;
    reg [1:0] state, next_state;
    
    always @(posedge clk, negedge aresetn) begin
        if (~aresetn) state <= s0;
        else state <= next_state;
    end
    always @(*) begin
        case (state) 
            s0: begin
                next_state = (x)? s1:s0;
                z = 0;
            end
            s1: begin
                next_state = (~x)? s2:s1;
                z = 0;
            end
            s2: begin
                next_state = (x)? s1:s0;
                z = x;
            end
        endcase
    end

endmodule
