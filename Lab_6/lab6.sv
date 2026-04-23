// Задание 1

//module lab6(
//    input logic clk,
//    input logic d,
//    output logic q
//);
//    always_ff @(posedge clk) begin
//        q <= d;
//    end
//endmodule

// Задание 2
//module lab6 (
//    input  logic clk,
//    input  logic reset,
//    input  logic d,
//    output logic q
//);
//    always_ff @(posedge clk)
//        if (reset)
//            q <= 1'b0;
//        else
//            q <= d;
//endmodule

// Задание 3
//module lab6 (
//    input  logic clk,
//    input  logic en,
//    input  logic d,
//    output logic q
//);
//    always_ff @(posedge clk)
//        if (en)
//            q <= d;
//endmodule

// Задание 4
//module lab6(
//    input  logic clk,
//    input  logic reset,          
//    output logic [3:0] q
//);
//logic and_out;
//assign and_out = q[0] & q[1] & q[2] & q[3];
//	always_ff @(posedge clk or posedge reset) begin
//        if (reset)
//            q <= 4'b1000;        
//        else
//            q <= {q[0], q[3:1]};  
//end
//endmodule


// Задание 5
//module lab6 (
//    input  logic clk,
//    input  logic sin,           
//    output logic [3:0] q         
//);
//logic [3:0] data;
//    
//always_ff @(posedge clk) 
//begin
//    data <= {data[2:0], sin};
//end
//    
//assign q = data;
//endmodule
