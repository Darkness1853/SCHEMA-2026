`timescale 1ns / 1ps

module counter_1_3();

logic clk;
logic reset;
logic button;
logic step_sel;
logic load_en;
logic [3:0] load_data;
logic [3:0] q;
logic ol;

lab7 dut (
    .clk       (clk),
    .reset     (reset),
    .button    (button),
    .step_sel  (step_sel),
    .load_en   (load_en),
    .load_data (load_data),
    .q         (q),
    .ol        (ol)
);

always #10 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    button = 0;
    step_sel = 0;
    load_en = 0;
    load_data = 0;
    
    #30 reset = 0;
    
    repeat(20) begin
        button = 1; #20;
        button = 0; #80;
    end
    
    step_sel = 1;
    
    repeat(10) begin
        button = 1; #20;
        button = 0; #80;
    end
    
    step_sel = 0;
    load_en = 1;
    load_data = 4'd7;
    #40;
    load_en = 0;
    
    button = 1; #20;
    button = 0; #80;
    
    #200 $finish;
end

endmodule