`timescale 1ns / 1ps

module ALU_Control(
    input  [2:0] opcode,
    input  [1:0] ALUOp,
    input  [3:0] Funct,
    output reg [3:0] Operacioni
    );

always @(*)
begin
    Operacioni = 4'b0100;

    case(ALUOp)

    2'b00:
        Operacioni = 4'b0100; // ADD (LW/SW)

    2'b01:
        Operacioni = 4'b1100; // SUB (BNE)

    2'b10:
    begin
        case(Funct)
        4'b1101: Operacioni = 4'b0011; // XOR
        4'b0000: Operacioni = 4'b0100; // ADD
        4'b0001: Operacioni = 4'b1100; // SUB
        4'b0010: Operacioni = 4'b0110; // MOD
        default: Operacioni = 4'b0100;
        endcase
    end

    2'b11:
    begin
        case(opcode)
        3'b100: Operacioni = 4'b0001; // SLTI
        3'b011: Operacioni = 4'b0101; // ADDI
        3'b010: Operacioni = 4'b0010; // ORI
        3'b001: Operacioni = 4'b0000; // ANDI
        default: Operacioni = 4'b0100;
        endcase
    end

    default: Operacioni = 4'b0100;

    endcase
end

endmodule
