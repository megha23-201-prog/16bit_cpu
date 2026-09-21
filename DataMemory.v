`timescale 1ns / 1ps

module DataMemory(
    input  [15:0] Adresa,
    input  [15:0] WriteData,
    input         Clock,
    input         MemWrite,
    input         MemRead,
    output [15:0] ReadData
);

reg [7:0] dMem[127:0];

// Initialize all memory to 0, then load from file
integer i;
initial begin
    for (i = 0; i < 128; i = i + 1)
        dMem[i] = 8'd0;
    $readmemb("dataMemory.mem", dMem);
end

// Clocked write (SW instruction)
always @(posedge Clock) begin
    if (MemWrite) begin
        dMem[Adresa]   <= WriteData[15:8];
        dMem[Adresa+1] <= WriteData[7:0];
    end
end

// Asynchronous read (LW instruction)
// Guarded by MemRead to avoid reading garbage when not needed
assign ReadData = MemRead ? {dMem[Adresa], dMem[Adresa+1]} : 16'd0;

endmodule
