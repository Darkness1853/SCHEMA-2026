`timescale 1ns / 100ps
module testbench3();

logic clk;
logic en;
logic d;
logic q;

lab6 uut(
    .clk(clk),
    .en(en),
    .d(d),
    .q(q)
);

always begin
    clk = 1; #5;
    clk = 0; #5;
end

initial begin
    clk = 0;
    en = 0;
    d = 0;
    
    #10 d = 1;
    #10 d = 0;
    #10 en = 1;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 en = 0;
    #10 d = 0;
    #10 d = 1;
    
    #20 $finish;
end

endmodule