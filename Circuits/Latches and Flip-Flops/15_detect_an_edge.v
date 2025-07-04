module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    integer i;
    reg [7:0] q, pedge_reg;
    assign pedge = pedge_reg;
    always @(posedge clk) begin
        for (i=0;i<=7;i=i+1) begin
            q <= in;
            pedge_reg <= in & ~q;
        end
    end

endmodule
