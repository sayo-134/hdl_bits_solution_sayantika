module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT=0,LEFT_FALL=1,DIG_LEFT=2,RIGHT=3,RIGHT_FALL=4,DIG_RIGHT=5,DIE=6;
    reg [2:0] state, next_state;
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= LEFT;
        else state <= next_state;
    end
    
    always @(*) begin
        walk_left=0;walk_right=0;aaah=0;digging=0;
        case (state)
            LEFT: begin
                walk_left=1;
                if (~ground) next_state=LEFT_FALL;
                else if (dig) next_state=DIG_LEFT;
                else begin
                    if (bump_left && bump_right) next_state = RIGHT;
                    else if (bump_right) next_state = LEFT;
                    else if (bump_left) next_state = RIGHT;
                    else next_state = LEFT;
                end
            end
            DIG_LEFT: begin
                digging=1;
                if (~ground) next_state=LEFT_FALL;
                else next_state = DIG_LEFT;
            end
            RIGHT: begin
                walk_right=1;
                if (~ground) next_state=RIGHT_FALL;
                else if (dig) next_state=DIG_RIGHT;
                else begin
                    if (bump_left && bump_right) next_state = LEFT;
                    else if (bump_right) next_state = LEFT;
                    else if (bump_left) next_state = RIGHT;
                    else next_state = RIGHT;
                end
            end
            DIG_RIGHT: begin
                digging=1;
                if (~ground) next_state=RIGHT_FALL;
                else next_state = DIG_RIGHT;
            end
            LEFT_FALL: begin
                aaah=1;
                if (ground) begin
                    if (fall_count_is_20) next_state = DIE;
                    else next_state = LEFT;
                end
                else next_state = LEFT_FALL;
            end
            RIGHT_FALL: begin
                aaah=1;
                if (ground) begin
                    if (fall_count_is_20) next_state = DIE;
                    else next_state = RIGHT;
                end
                else next_state = RIGHT_FALL;
            end
            DIE: begin
                next_state = DIE;
            end
        endcase
    end
    wire en_falling;
    assign en_falling = (state==LEFT_FALL)||(state==RIGHT_FALL);
    reg [5:0] fall_count;
    reg fall_count_is_20;
    assign fall_count_is_20 = (fall_count==5'd20);
    always @(posedge clk, posedge areset) begin
        if (areset) fall_count <= 0;
        else if (en_falling) begin
            if (fall_count==5'd20) fall_count<=fall_count;
            else fall_count <= fall_count + 1;
        end
        else fall_count <= 0;
    end
endmodule
