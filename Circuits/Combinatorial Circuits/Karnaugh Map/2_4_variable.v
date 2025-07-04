module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~b)&(~c) | (~a)&(~d) | a & (~b) & d | b & c & d;
endmodule
