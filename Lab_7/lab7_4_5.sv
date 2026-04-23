module counter (
    input  logic       clk,
    input  logic       rst,
    input  logic       en,
    input  logic       ld,
    input  logic [3:0] ld_val,
    input  logic [3:0] rst_val,
    output logic [3:0] out,
    output logic       cr
);
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            out <= rst_val;
        else if (ld)
            out <= ld_val;
        else if (en)
            out <= out + 1'b1;
    end
    assign cr = en && (out == 4'b1111);
endmodule

module lab7_4_5 (
    input  logic       clk,
    input  logic       rst,
    input  logic       en,
    output logic [8:0] res,
    output logic       done
);
    logic [3:0] a, b, c;
    logic ca, cb;
    logic ld_sig;
    
    assign ld_sig = rst | done;
    
    counter u0 (
        .clk   (clk),
        .rst   (rst),
        .en    (en),
        .ld    (ld_sig),
        .ld_val(4'b0111),
        .rst_val(4'b0111),
        .out   (a),
        .cr    (ca)
    );
    
    counter u1 (
        .clk   (clk),
        .rst   (rst),
        .en    (ca),
        .ld    (ld_sig),
        .ld_val(4'b0001),
        .rst_val(4'b0001),
        .out   (b),
        .cr    (cb)
    );
    
    counter u2 (
        .clk   (clk),
        .rst   (rst),
        .en    (cb),
        .ld    (ld_sig),
        .ld_val(4'b0000),
        .rst_val(4'b0000),
        .out   (c),
        .cr    ()
    );
    
    assign res = {c[0], b, a};
    assign done = (res == 9'd263);
endmodule