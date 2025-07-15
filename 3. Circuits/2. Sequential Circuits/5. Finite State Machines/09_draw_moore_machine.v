module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter L1=0,L2a=1,L2b=2,L3a=3,L3b=4,L4=5;
    reg [2:0] state, next_state;
    
    always @(*) begin
        case (state) 
            L1: begin
                fr1=1;fr2=1;fr3=1;dfr=1;
                if (s[1]) next_state=L2a;
                else next_state=L1;
            end
            L2a: begin
                fr1=1;fr2=1;fr3=0;dfr=0;
                if (s[2]) next_state=L3a;
                else if (~s[1]) next_state=L1;
                else next_state=L2a;
            end
            L3a: begin
                fr1=1;fr2=0;fr3=0;dfr=0;
                if (s[3]) next_state=L4;
                else if (~s[2]) next_state=L2b;
                else next_state=L3a;
            end
            L4: begin
                fr1=0;fr2=0;fr3=0;dfr=0;
                if (~s[3]) next_state=L3b;
                else next_state=L4;
            end
            L3b: begin
                fr1=1;fr2=0;fr3=0;dfr=1;
                if (s[3]) next_state=L4;
                else if (~s[2]) next_state = L2b;
                else next_state=L3b;
            end
            L2b: begin
                fr1=1;fr2=1;fr3=0;dfr=1;
                if (s[2]) next_state=L3a;
                else if (~s[1]) next_state=L1;
                else next_state=L2b;
            end
        endcase
    end
	
    always @(posedge clk) begin
        if (reset) state <= L1;
        else state <= next_state;
    end
    
endmodule
