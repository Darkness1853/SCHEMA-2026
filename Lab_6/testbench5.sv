`timescale 1ns / 100ps
module testbench5();

logic clk;
logic sin;
logic [3:0] q;

lab6 uut(
    .clk(clk),
    .sin(sin),
    .q(q)
);

always begin
    clk = 1; #5;
    clk = 0; #5;
end

initial begin
    clk = 0;
    sin = 0;
    #10 sin = 1;
    #10 sin = 0;
    #10 sin = 1;
    #10 sin = 1;
    #10 sin = 0;
    #10 sin = 1;
    #20 $finish;
end

endmodule