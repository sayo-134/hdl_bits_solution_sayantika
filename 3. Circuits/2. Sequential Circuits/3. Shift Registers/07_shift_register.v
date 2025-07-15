module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] q;
    assign out = q[3];
    always @(posedge clk) begin
        if (~resetn) q <= 4'd0;
        else q <= {q[2:0],in};
    end

endmodule
