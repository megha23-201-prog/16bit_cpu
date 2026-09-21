`timescale 1ns / 1ps

// Top-level CPU module.
// Output ports added so Vivado does not optimize away all logic
// ("design is empty" error occurs when there are no observable outputs).

module CPU(
    input        Clock,
    output [2:0] opcode_out,    // exposes opcode - prevents logic pruning
    output       reg_write_out  // exposes RegWrite - keeps datapath alive
);

wire        RegDst;
wire        ALUSrc;
wire        MemToReg;
wire        RegWrite;
wire        MemRead;
wire        MemWrite;
wire [1:0]  ALUOp;
wire        Branch;
wire [2:0]  opcode;

// Feed internal signals to output ports so synthesizer keeps all logic
assign opcode_out    = opcode;
assign reg_write_out = RegWrite;

DataPath DP(
    Clock,
    RegDst,
    Branch,
    MemRead,
    MemWrite,
    RegWrite,
    MemToReg,
    ALUSrc,
    ALUOp,
    opcode
);

ControlUnit CU(
    opcode,
    RegDst,
    ALUSrc,
    MemToReg,
    RegWrite,
    MemRead,
    MemWrite,
    ALUOp,
    Branch
);

endmodule
