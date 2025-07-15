`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	wire int_wire1, int_wire2;
    assign int_wire1 = a&b;
    assign int_wire2 = c&d;
    assign out = int_wire1 | int_wire2;
    assign out_n = ~out;
endmodule
