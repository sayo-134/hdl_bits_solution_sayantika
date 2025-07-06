module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    always @(posedge clk) begin
        if (reset) begin
            pm <= 1'b0;
            hh <= 8'h12;
            mm <= 8'h00;
            ss <= 8'h00;
        end
        else if (ena) begin
            ss[3:0] <= (ss[3:0]==4'h9)? 4'h0 : (ss[3:0] + 4'h1);
            ss[7:4] <= (ss[3:0]==4'h9)? ((ss[7:4]==4'h5)? 4'h0:(ss[7:4]+4'h1)):ss[7:4];
            
            mm[3:0] <= (ss==8'h59)?((mm[3:0]==4'h9)?4'h0:(mm[3:0]+4'h1)):mm[3:0];
            mm[7:4] <= (ss==8'h59)?((mm[3:0]==4'h9)?((mm[7:4]==4'h5)?4'h0:(mm[7:4]+4'h1)):mm[7:4]):mm[7:4];
            
            if (ss == 8'h59 && mm == 8'h59) begin
            if (hh == 8'h11) begin
                hh <= 8'h12;
                pm <= ~pm;  // Toggle AM/PM at 11 -> 12
            end else if (hh == 8'h12) begin
                hh <= 8'h01;
            end else begin
                // General case
                hh[3:0] <= (hh[3:0] == 4'h9) ? 4'h0 : (hh[3:0] + 4'h1);
                hh[7:4] <= (hh[3:0] == 4'h9) ? (hh[7:4] + 4'h1) : hh[7:4];
            end
        end
        end
    end

endmodule
