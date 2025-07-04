module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] q, anyedge_reg;
    assign anyedge = anyedge_reg;
    always @(posedge clk) begin
        q <= in;
        anyedge_reg <= in ^ q;
    end

endmodule
