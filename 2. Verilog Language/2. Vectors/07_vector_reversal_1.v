module top_module( 
    input [7:0] in,
    output [7:0] out
);
    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};
  // assign out[0:7] = in[7:0] or out[7:0] = in[0:7] won't work as verilog does not support order flipping
endmodule
