module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A=0,B=1,C=2,D=3,E=4,F=5,G=6,H=7,I=8;
    reg [3:0] state, next_state;
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next_state;
    end
    always @(*) begin
        case (state) 
            A: begin
                next_state = (s)? B:A;
                z = 0;
            end
            B: begin
                next_state = (w)? C:D;
                z = 0;
            end
            C: begin
                next_state = (w)?E:F;
                z = 0;
            end
            D: begin
                next_state = (w)?F:I;
                z = 0;
            end
            E: begin
                next_state = (w)? H:G;
                z = 0;
            end
            F: begin
                next_state = (w)? G:H;
                z = 0;
            end
            G: begin
                next_state = (w)? C:D;
                z = 1;
            end
            H: begin
                next_state = (w)? C:D;
                z = 0;
            end
            I: begin
                next_state = H;
                z = 0;
            end
        endcase
    end

endmodule
