module top_module (
    input clock,
    input a,
    output p,
    output q );
	reg p_b;
    always @(negedge clock) q <= p;
    always @(negedge clock) p_b <= a;
    always @(*) p = (clock)? a:p_b;
endmodule
