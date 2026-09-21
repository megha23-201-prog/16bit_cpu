`timescale 1ns / 1ps

module RegisterFile(
    input  [2:0]  RS,
    input  [2:0]  RT,
    input  [2:0]  RD,
    input  [15:0] WriteData,
    output [15:0] ReadRS,
    output [15:0] ReadRT,
    input         RegWrite,
    input         Clock
);

reg [15:0] Registers[7:0];

// Initialize all registers to 0
integer i;
initial begin
    for (i = 0; i < 8; i = i + 1)
        Registers[i] = 16'd0;
end

// Clocked write port
always @(posedge Clock) begin
    if (RegWrite)
        Registers[RD] <= WriteData;
end

// Asynchronous read ports
assign ReadRS = Registers[RS];
assign ReadRT = Registers[RT];

endmodule
