module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] q, pedge_reg;
    assign pedge = pedge_reg;
    always @(posedge clk) begin
        q <= in;
        pedge_reg <= in & ~q;
    end

endmodule
