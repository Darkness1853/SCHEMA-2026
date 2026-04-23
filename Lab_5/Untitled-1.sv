`timescale 1ns / 100ps
module testbench;
    logic [3:0] operandA, operandB;
    logic [2:0] funcsel;
    logic [3:0] result;
    logic zero;
    logic negative;
    logic [3:0] expected_result;
    logic expected_zero;
    logic expected_negative;
    integer errors;
    logic [3:0] sum;
    logic msb;
    
    lab5 uut (
        .operandA(operandA),
        .operandB(operandB),
        .funcsel(funcsel),
        .result(result),
        .zero(zero),
        .negative(negative)
    );
    
    task check_output;
        if (result !== expected_result || zero !== expected_zero || negative !== expected_negative) begin
            $error("Time=%0t A=%b B=%b F=%b Exp: res=%b zero=%b neg=%b Got: res=%b zero=%b neg=%b", 
                   $time, operandA, operandB, funcsel, expected_result, expected_zero, expected_negative, result, zero, negative);
            errors = errors + 1;
        end else begin
            $display("OK: A=%b B=%b F=%b res=%b zero=%b neg=%b", 
                    operandA, operandB, funcsel, result, zero, negative);
        end
    endtask
    
    initial begin
        errors = 0;
        
        funcsel = 3'b000;
        operandA = 4'b1100;
        operandB = 4'b1010;
        #10;
        expected_result = operandA & operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        operandA = 4'b1111;
        operandB = 4'b0000;
        #10;
        expected_result = operandA & operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();

        funcsel = 3'b001;
        operandA = 4'b1100;
        operandB = 4'b0011;
        #10;
        expected_result = operandA | operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        operandA = 4'b0000;
        operandB = 4'b0000;
        #10;
        expected_result = operandA | operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();

        funcsel = 3'b010;
        operandA = 4'b0011;
        operandB = 4'b0101;
        #10;
        expected_result = operandA + operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        operandA = 4'b0111;
        operandB = 4'b1001;
        #10;
        expected_result = operandA + operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        funcsel = 3'b100;
        operandA = 4'b1100;
        operandB = 4'b1010;
        #10;
        expected_result = operandA & ~operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        operandA = 4'b0000;
        operandB = 4'b1111;
        #10;
        expected_result = operandA & ~operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        
        
        funcsel = 3'b101;
        operandA = 4'b1100;
        operandB = 4'b1010;
        #10;
        expected_result = operandA | ~operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        operandA = 4'b0000;
        operandB = 4'b1111;
        #10;
        expected_result = operandA | ~operandB;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        funcsel = 3'b110;
        operandA = 4'b1000;
        operandB = 4'b0011;
        #10;
        expected_result = operandA + ~operandB + 1;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        operandA = 4'b0101;
        operandB = 4'b0101;
        #10;
        expected_result = operandA + ~operandB + 1;
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        
        
        funcsel = 3'b111;
        operandA = 4'b0011;
        operandB = 4'b0101;
        #10;
        sum = operandA + ~operandB + 1;
        msb = sum[3];
        expected_result = {3'b0, msb};
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
        operandA = 4'b0110;
        operandB = 4'b0010;
        #10;
        sum = operandA + ~operandB + 1;
        msb = sum[3];
        expected_result = {3'b0, msb};
        expected_zero = (expected_result == 4'b0000);
        expected_negative = expected_result[3];
        check_output();
        
    end
endmodule