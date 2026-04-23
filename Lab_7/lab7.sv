
module antitinkling (
    input logic button,
    input logic clk,
    input logic reset,
    output logic out
);
    logic [19:0] q;
    
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else
            q <= q + 1;
    end
    
    assign out = (q == 20'hFFFFF) ? button : out;
    
endmodule


module lab7 (
    input  logic       clk,
    input  logic       reset,
    input  logic       button,
    input  logic       step_sel,    
    input  logic       load_en,   
    input  logic [3:0] load_data,   
    output logic [3:0] q,
    output logic       ol
);
    logic clean_button;
    
    // Антидребезг
    antitinkling at (
        .button(button),
        .clk(clk),
        .reset(reset),
        .out(clean_button)
    );
    
    logic [3:0] step_value;
    assign step_value = step_sel ? 4'd4 : 4'd1;
    
    // Счётчик
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0;
        else if (load_en)
            q <= load_data;
        else if (clean_button)
            q <= q + step_value;
    end
    
    assign ol = (q == 4'b1111);
    
endmodule