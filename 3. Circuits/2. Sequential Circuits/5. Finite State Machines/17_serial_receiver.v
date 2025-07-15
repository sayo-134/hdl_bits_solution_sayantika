module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    reg [3:0] state, next_state;
    parameter [3:0] S0=4'd0,S1=4'd1,S2=4'd2,S3=4'd3,S4=4'd4,S5=4'd5,S6=4'd6,S7=4'd7,S8=4'd8,S9=4'd9,S10=4'd10,S11=4'd11;
    
    always @(posedge clk) begin
        if (reset) state <= S0;
        else state <= next_state;
    end
    
    always @(*) begin
        case(state)
            S0: begin
                done=1'b0;
                next_state = (in)? S0:S1;
            end
            S1: begin
                done=1'b0;
                next_state=S2;
            end
            S2: begin
                done=1'b0;
                next_state=S3;
            end
            S3: begin
                done=1'b0;
                next_state=S4;
            end
            S4: begin
                done=1'b0;
                next_state=S5;
            end
            S5: begin
                done=1'b0;
                next_state=S6;
            end
            S6: begin
                done=1'b0;
                next_state=S7;
            end
            S7: begin
                done=1'b0;
                next_state=S8;
            end
            S8: begin
                done=1'b0;
                next_state=S9;
            end
            S9: begin
                done=1'b0;
                next_state= (in)? S10:S11;
            end
            S10: begin
                done=1'b1;
                next_state=(in)? S0:S1;
            end
            S11: begin
                done=1'b0;
                next_state= (in)? S0:S11;
            end
        endcase
    end
endmodule

