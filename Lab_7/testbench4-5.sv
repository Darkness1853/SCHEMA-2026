`timescale 1ns / 1ps

module testbench();

logic clk;
logic rst;
logic en;
logic [8:0] res;
logic done;

lab7_4_5 uut (
    .clk  (clk),
    .rst  (rst),
    .en   (en),
    .res  (res),
    .done (done)
);

always #10 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    en = 0;
    
    #30 rst = 0;
    #20 en = 1;
    
    wait(done);
    
    #200 $finish;
end

endmodule