module top_module (
    input clk,
    input x,
    output z
); 
    reg q1, q2, q3;
    assign z = ~(q1 | q2 | q3);
    always @(posedge clk) begin
        q1 <= x ^ q1;
        q2 <= ~q2 & x;
        q3 <= ~q3 | x;
    end

endmodule
