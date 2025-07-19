module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    parameter a=0,b=1,c=2,d=3,e=4,f=5,g=6,h=7,i=8,j=9;
    reg [3:0] state, next_state;
    reg shift_ena;
    wire done_counting;
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
	
    assign done_counting = (count==0)&(count_1000==10'd999);
    reg [9:0] count_1000;
    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            count_1000 <= 0;
        end
        else if (shift_ena) count <= {count[2:0],data};
        else if (counting) begin
            if (count >= 0) begin
                if (count_1000==10'd999) begin
                    count <= count - 1;
                    count_1000 <= 0;
                end
                else count_1000 <= count_1000 + 1;
            end
        end
    end

endmodule
