module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter A=0,B=1,C=2,D=3,E=4,F=5,G=6,H=7,I=8;
    reg [3:0] state, next_state;
    
    always @(posedge clk) begin
        if (~resetn) state <= A;
        else state <= next_state;
    end
    always @(*) begin
        f=0;g=0;
        case (state)
            A: begin
                next_state=B;
            end
            B: begin
                next_state=D;
                f=1;
            end
            D: begin
                next_state=(x)? C:D;
            end
            C: begin
                next_state=(~x)? E:C;
            end
            E: begin
                next_state=(x)? F:D;
            end
            F: begin
                next_state = (y)? G:H;
                g=1;
            end
            G: begin
                next_state = G;
                g=1;
            end
            H: begin
                next_state = (y)? G:I;
                g=1;
            end
            I: begin
                next_state = I;
            end
        endcase
    end

endmodule
