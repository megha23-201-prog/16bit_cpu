`timescale 1ns / 1ps

module ControlUnit(
    input  [2:0] OPCODE,
    output reg   RegDst,
    output reg   ALUSrc,
    output reg   MemToReg,
    output reg   RegWrite,
    output reg   MemRead,
    output reg   MemWrite,
    output reg [1:0] ALUOp,
    output reg   Branch
    );

always @(*)
begin
    case(OPCODE)

    3'b111: // BNE
    begin
        RegDst   = 1'b0;
        ALUSrc   = 1'b0;
        MemToReg = 1'b0;
        RegWrite = 1'b0;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        ALUOp    = 2'b01;
        Branch   = 1'b1;
    end

    3'b000: // R-type: ADD / SUB / XOR / MOD
    begin
        RegDst   = 1'b1;
        ALUSrc   = 1'b0;
        MemToReg = 1'b0;
        RegWrite = 1'b1;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        ALUOp    = 2'b10;
        Branch   = 1'b0;
    end

    3'b001: // ANDI
    begin
        RegDst   = 1'b0;
        ALUSrc   = 1'b1;
        MemToReg = 1'b0;
        RegWrite = 1'b1;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        ALUOp    = 2'b11;
        Branch   = 1'b0;
    end

    3'b100: // SLTI
    begin
        RegDst   = 1'b0;
        ALUSrc   = 1'b1;
        MemToReg = 1'b0;
        RegWrite = 1'b1;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        ALUOp    = 2'b11;
        Branch   = 1'b0;
    end

    3'b011: // ADDI
    begin
        RegDst   = 1'b0;
        ALUSrc   = 1'b1;
        MemToReg = 1'b0;
        RegWrite = 1'b1;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        ALUOp    = 2'b11;
        Branch   = 1'b0;
    end

    3'b010: // ORI
    begin
        RegDst   = 1'b0;
        ALUSrc   = 1'b1;
        MemToReg = 1'b0;
        RegWrite = 1'b1;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        ALUOp    = 2'b11;
        Branch   = 1'b0;
    end

    3'b101: // LW
    begin
        RegDst   = 1'b0;
        ALUSrc   = 1'b1;
        MemToReg = 1'b1;
        RegWrite = 1'b1;
        MemRead  = 1'b1;
        MemWrite = 1'b0;
        ALUOp    = 2'b00;
        Branch   = 1'b0;
    end

    3'b110: // SW
    begin
        RegDst   = 1'b0;
        ALUSrc   = 1'b1;
        MemToReg = 1'b0;
        RegWrite = 1'b0;
        MemRead  = 1'b0;
        MemWrite = 1'b1;
        ALUOp    = 2'b00;
        Branch   = 1'b0;
    end

    default:
    begin
        RegDst   = 1'b0;
        ALUSrc   = 1'b0;
        MemToReg = 1'b0;
        RegWrite = 1'b0;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        ALUOp    = 2'b00;
        Branch   = 1'b0;
    end

    endcase
end

endmodule
