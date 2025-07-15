module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 
    count4 the_counter (clk, c_enable, c_load, c_d, Q);
    
  assign c_enable = ~reset & enable;
  assign c_load = reset | ((Q==4'd12) & c_enable);
  assign c_d = (c_load)? 4'd1 : 4'd0; 

endmodule
