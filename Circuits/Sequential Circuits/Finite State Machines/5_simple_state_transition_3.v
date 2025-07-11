module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    assign next_state = (~in)?((state==A || state==C)?A:C):((state==C)?D:B);
    // assign next_state = (~in)?((state[0]==1'b1)?C:A):((state==C)?D:B);
    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state==D);

endmodule
