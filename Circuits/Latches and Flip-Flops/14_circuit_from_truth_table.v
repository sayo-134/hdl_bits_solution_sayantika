module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    reg q;
    assign Q=q;
    always @(posedge clk) begin
        case ({j,k})
            2'b00: q <= q;
            2'b11: q <= ~q;
            2'b01, 2'b10: q <= j;
        endcase
    end
endmodule
