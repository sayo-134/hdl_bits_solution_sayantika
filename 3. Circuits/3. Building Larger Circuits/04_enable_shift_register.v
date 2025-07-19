module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena); 
    reg [1:0] count4;
    always @(posedge clk) begin
        if (reset) begin
            count4 <= 0;
        end
        else begin
            count4 <= (count4==2'd3)? 2'd3:(count4 + 1);
        end
    end
    always @(posedge clk) begin
        if (reset) shift_ena <= 1;
        else shift_ena <= (count4==2'd3)? 0:1;
    end
endmodule
