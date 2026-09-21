`timescale 1ns / 1ps


module Adder_1bit(
    input A,
    input B,
    input CarryIn,
    output Sum,
    output CarryOut
);
    assign Sum     = A ^ B ^ CarryIn;
    assign CarryOut = (A & B) | (B & CarryIn) | (A & CarryIn);
endmodule