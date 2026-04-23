module lab5(
    input logic [3:0] operandA, operandB,
    input logic [2:0] funcsel,
    output logic [3:0] result,
    output logic zero,
    output logic negative
);

logic [3:0] maybeinvertedB;
assign maybeinvertedB = funcsel[2] ? ~operandB : operandB;

logic [3:0] sum;
assign sum = operandA + maybeinvertedB + funcsel[2];

always_comb
    case (funcsel[1:0])
        2'b00: result = operandA & maybeinvertedB;
        2'b01: result = operandA | maybeinvertedB;
        2'b10: result = sum;
        2'b11: result = {3'b0, sum[3]};
    endcase

assign zero = (result == 4'b0000);
assign negative = result[3];

endmodule