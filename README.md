# 16-bit CPU (Verilog)

A single-cycle 16-bit CPU implemented in Verilog HDL, targeting the Digilent **Arty S7** FPGA board (Xilinx XC7S25, Vivado toolchain).

## Overview

The design follows a classic single-cycle datapath/control-unit split (similar in spirit to a scaled-down MIPS core):

- **`CPU.v`** — top-level module; wires the `DataPath` and `ControlUnit` together and exposes `opcode` / `RegWrite` as outputs so synthesis doesn't optimize the design away.
- **`ControlUnit.v`** — decodes the 3-bit opcode into control signals (`RegDst`, `ALUSrc`, `MemToReg`, `RegWrite`, `MemRead`, `MemWrite`, `ALUOp`, `Branch`).
- **`DataPath.v`** — program counter, instruction fetch, register file access, ALU operand muxing, branch address calculation.
- **`ALU_16bit.v`**, **`ALU_1bit.v`**, **`ALU_Control.v`** — 16-bit ALU built from cascaded 1-bit ALU slices, with a control decoder for the operation select lines.
- **`Adder_16bit.v`**, **`Adder_1bit.v`** — ripple-carry adder building blocks.
- **`RegisterFile.v`** — general-purpose register file.
- **`InstructionMemory.v`** / **`instrMemory.mem`** — instruction ROM and its initial contents.
- **`DataMemory.v`** / **`dataMemory.mem`** — data RAM and its initial contents.
- **`mux2ne1.v`**, **`mux8ne1.v`** — reusable multiplexers.
- **`modFunction.v`**, **`SltiFunction.v`** — helper modules for MOD and SLTI-style operations.

Supported opcodes (see `ControlUnit.v`) include R-type ALU ops (ADD / SUB / XOR / MOD), branch-not-equal (BNE), and standard load/store/immediate-style instructions.

## Repository layout

```
16bit_cpu_complete/
├── source/       Synthesizable RTL sources (.v) and memory init files (.mem)
├── simulation/   Testbenches for the CPU, register file, and memories
└── constrt/      Xilinx .xdc constraints file for the Arty S7 Rev. C board
```

## Simulating

Each testbench in `simulation/` is self-contained. With a Verilog simulator such as Icarus Verilog:

```bash
iverilog -o cpu_sim source/*.v simulation/CPUTest.v
vvp cpu_sim
```

(Swap in `RegisterFile_Test.v`, `DataMemory_Test.v`, or `InstructionMemory_Test.v` to test those modules individually.) The same files also open directly in Vivado's built-in simulator.

## Building for hardware (Vivado)

1. Create a new Vivado project targeting the **Arty S7-25** (`xc7s25csga324-1`).
2. Add everything under `source/` as design sources.
3. Add `constrt/CPU_Arty_S7_RevC.xdc` as a constraints file (only the active, uncommented lines are used — see the comments inside the file for how to enable additional I/O).
4. Run synthesis → implementation → generate bitstream, then program the board.

## Notes

- The register file, ALU, adders, and muxes are built from small structural building blocks rather than behavioral shortcuts, so the design doubles as a study aid for how a CPU's datapath fits together at the gate/module level.
- `instrMemory.mem` and `dataMemory.mem` hold the initial memory contents loaded at simulation/synthesis time — edit these to load a different program.
