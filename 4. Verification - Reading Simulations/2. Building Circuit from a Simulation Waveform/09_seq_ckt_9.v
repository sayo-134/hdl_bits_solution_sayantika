module top_module (
    input clk,
    input a,
    output [3:0] q );
    always @(posedge clk) begin
        if (a) q <= 4'd4;
        else q <= (q==4'd6)?4'd0:(q+1'd1);
    end

endmodule
