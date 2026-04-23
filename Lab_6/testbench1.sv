`timescale 1ns / 100ps
module testbench1();

logic clk;
logic d;
logic q;

lab6 uut(
    .clk(clk),
    .d(d),
    .q(q)
);

always begin
    clk = 1; #5;
    clk = 0; #5;
end

initial begin
    clk = 0;
    d = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 1;
    #10 d = 0;
    #20 $finish;
end

endmodule