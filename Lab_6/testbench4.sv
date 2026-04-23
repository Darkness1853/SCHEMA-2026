`timescale 1ns / 100ps
module testbench4();

logic clk;
logic reset;
logic [3:0] q;

lab6 uut(
    .clk(clk),
    .reset(reset),
    .q(q)
);

always begin
    clk = 1; #5;
    clk = 0; #5;
end

initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #80 reset = 1;
    #10 reset = 0;
    #40 $finish;
end

endmodule