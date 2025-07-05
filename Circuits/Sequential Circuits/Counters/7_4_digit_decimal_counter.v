module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
	wire ena0;
    assign ena0 = 1'b1;
    bcdcount count0 (clk, reset, ena0  , q[ 3: 0]);
    bcdcount count1 (clk, reset, ena[1], q[ 7: 4]);
    bcdcount count2 (clk, reset, ena[2], q[11: 8]);
    bcdcount count3 (clk, reset, ena[3], q[15:12]);
    
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[3:0] == 4'd9) && (q[7:4] == 4'd9);
    assign ena[3] = (q[3:0] == 4'd9) && (q[7:4] == 4'd9) && (q[11:8] == 4'd9);
    
endmodule

module bcdcount (
	input clk,
    input reset,
    input enable,
    output [3:0] q
);
    always @(posedge clk) begin
        if (reset) q <= 4'd0;
        else if (enable) q <= (q==4'd9)? 4'd0: (q + 4'd1);
    end
    
endmodule
