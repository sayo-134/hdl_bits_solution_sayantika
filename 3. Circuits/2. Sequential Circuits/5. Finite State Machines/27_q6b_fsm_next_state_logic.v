module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    assign Y2 = (y==3'd1)||(y==3'd5)||w & ((y==3'd2) || (y==3'd4));

endmodule
