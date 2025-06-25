// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //
	wire a,b;
    always @(*) begin
        //a = shut_off_computer;
        if (cpu_overheated)
           shut_off_computer = 1;
        else shut_off_computer = 0/*a*/;
    end

    always @(*) begin
        //b = keep_driving;
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else keep_driving = 0/*b*/;
    end
