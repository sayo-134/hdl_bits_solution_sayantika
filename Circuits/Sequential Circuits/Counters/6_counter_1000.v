module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] q_fast, q_mid, q_slow;
    bcdcount counter0 (clk, reset, c_enable[0], q_fast);
    bcdcount counter1 (clk, reset, c_enable[1], q_mid);
    bcdcount counter2 (clk, reset, c_enable[2], q_slow);
    
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (q_fast==4'd9);
    assign c_enable[2] = ((q_fast == 4'd9) && (q_mid==4'd9));
    assign OneHertz = ((q_fast == 4'd9) && (q_mid==4'd9) && (q_slow==4'd9));
endmodule
