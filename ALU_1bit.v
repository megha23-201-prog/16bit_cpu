`timescale 1ns / 1ps

module ALU_1bit(
    input A,
    input B,
    input CIN,
    input Bnegate,
    input Less,
    input [2:0] Operation,
    output Result,
    output COUT
);

// Internal wires
wire JoA, JoB, mB;
wire Andi, Ori, Xor;
wire AddnSub, Addi;
wire Slti, Mod;
wire Cout_add, Cout_addi;

// Inversions
assign JoA = ~A;
assign JoB = ~B;

// B selection (for subtraction)
mux2ne1 muxB(B, JoB, Bnegate, mB);

// Logic operations
assign Andi = A & mB;
assign Ori  = A | mB;
assign Xor  = (JoA & B) | (A & JoB);

// Extra operations (keep as is if already implemented)
SltiFunction sltiFunc(A, B, Slti);
modFunction modFunc(A, B, Mod);

// Add/Sub operations (FIXED: separate carry wires)
Adder_1bit AddiFunc(A, mB, CIN, Addi, Cout_addi);
Adder_1bit Adder   (A, mB, CIN, AddnSub, Cout_add);

// FINAL carry output (ONLY ONE DRIVER)
assign COUT = (Operation == 3'b100) ? Cout_add :
              (Operation == 3'b101) ? Cout_addi :
              1'b0;

// Result selection
mux8ne1 muxAlu(
    Andi,     // 000
    Slti,     // 001
    Ori,      // 010
    Xor,      // 011
    AddnSub,  // 100
    Addi,     // 101
    Mod,      // 110
    Less,     // 111
    Operation,
    Result
);

endmodule