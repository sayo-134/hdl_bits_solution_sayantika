module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    always @(posedge clk, posedge areset) begin
        if(areset) state <= 2'b01;
        else if (train_valid) begin
            if (train_taken) begin
                if (state < 2'b11) state <= state + 1'b1;
            end
            else if (state > 2'b00) state <= state - 1'b1;
        end
    end

endmodule
