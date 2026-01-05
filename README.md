# 🧠 Single-Cycle Processor – SystemVerilog (Vivado)

## 📌 Project Overview

This repository contains a **Single-Cycle Processor** designed and implemented using **SystemVerilog**.
The processor executes each instruction in **one clock cycle**, following a classical RISC-style datapath.
The project was developed as part of an academic course to strengthen understanding of **computer architecture**, **RTL design**, and **hardware description using SystemVerilog**.

The design is **fully modular**, synthesizable, and verified using testbenches in **Xilinx Vivado**.

---

## 🎯 Key Features

* Single-cycle instruction execution
* Modular RTL design using SystemVerilog
* Separate datapath and control logic
* Register file with synchronous write
* ALU with control decoding
* Instruction and data memory
* Fully testable using simulation
* Designed for clarity, correctness, and learning

---

## 🛠 Tools & Technologies

* **Language:** SystemVerilog
* **Simulation:** Vivado Simulator
* **Synthesis:** Xilinx Vivado
* **Design Style:** RTL, modular architecture

---

## 📂 Project Structure

```
Single-Cycle-Processor/
│
├── rtl/
│   ├── top.sv
│   ├── pc.sv
│   ├── instruction_memory.sv
│   ├── data_memory.sv
│   ├── reg_file.sv
│   ├── alu.sv
│   ├── alu_control.sv
│   ├── control_unit.sv
│   ├── imm_gen.sv
│   ├── adder.sv
│   ├── mux.sv
│   └── branch_unit.sv
│
├── tb/
│   └── processor_tb.sv
│
├── docs/
│   └── project_report.pdf
│
└── README.md
```

---

## 🧩 Module Description (Detailed)

### 🔹 1. Top Module (`top.sv`)

* Integrates **all datapath and control modules**
* Acts as the main processor wrapper
* Connects PC, instruction memory, register file, ALU, and data memory
* Controls instruction flow for each clock cycle

---

### 🔹 2. Program Counter (`pc.sv`)

* Holds the address of the current instruction
* Updated every clock cycle
* Supports:

  * `PC + 4` (normal execution)
  * Branch target address (conditional control)

---

### 🔹 3. Instruction Memory (`instruction_memory.sv`)

* Stores program instructions
* Read-only memory
* Outputs instruction based on current PC value

---

### 🔹 4. Control Unit (`control_unit.sv`)

* Decodes the **opcode** field of the instruction
* Generates control signals such as:

  * `RegWrite`
  * `MemRead`
  * `MemWrite`
  * `ALUSrc`
  * `MemtoReg`
  * `Branch`
* Acts as the **brain** of the processor

---

### 🔹 5. Register File (`reg_file.sv`)

* Contains general-purpose registers
* Supports:

  * Two simultaneous read ports
  * One synchronous write port
* Register 0 is hardwired to zero (if RISC-style)

---

### 🔹 6. Immediate Generator (`imm_gen.sv`)

* Extracts and sign-extends immediate values
* Supports multiple instruction formats:

  * I-type
  * S-type
  * B-type
  * U-type
  * J-type
* Feeds immediate values to ALU

---

### 🔹 7. ALU (`alu.sv`)

* Performs arithmetic and logical operations:

  * Add, Subtract
  * AND, OR, XOR
  * Shift operations
  * Comparison
* Output used for:

  * Arithmetic results
  * Memory addressing
  * Branch comparisons

---

### 🔹 8. ALU Control (`alu_control.sv`)

* Decodes:

  * `funct3`
  * `funct7`
  * `ALUOp`
* Generates exact ALU operation signals
* Bridges **control unit** and **ALU**

---

### 🔹 9. Data Memory (`data_memory.sv`)

* Used for load/store instructions
* Supports:

  * Read (load)
  * Write (store)
* Address comes from ALU output

---

### 🔹 10. Branch Unit (`branch_unit.sv`)

* Evaluates branch conditions
* Works with ALU comparison results
* Decides whether branch is taken or not

---

### 🔹 11. Adders (`adder.sv`)

* Used for:

  * `PC + 4`
  * Branch target address calculation
* Simple combinational logic

---

### 🔹 12. Multiplexers (`mux.sv`)

* Used extensively in datapath
* Select between:

  * Register vs Immediate
  * ALU result vs Memory data
  * PC + 4 vs Branch address

---

## 🧪 Testbench (`processor_tb.sv`)

* Verifies correct processor functionality
* Simulates:

  * Instruction execution
  * Register updates
  * Memory operations
* Uses waveform inspection for debugging

---

## 🔁 Processor Execution Flow

1. Fetch instruction using PC
2. Decode instruction & generate control signals
3. Read registers
4. Execute ALU operation
5. Access data memory (if needed)
6. Write result back to register
7. Update PC

➡️ **All steps occur in one clock cycle**

---

## ⚠️ Design Notes

* No pipelining (single-cycle design)
* No hazard handling required
* Optimized for clarity and learning, not performance
* Suitable foundation for pipelined or multi-cycle extensions

---

## 🚀 Possible Extensions

* Multi-cycle processor
* 5-stage pipelined processor
* Hazard detection & forwarding
* Cache integration
* Branch prediction
* Floating-point unit

---

## 👤 Author

**Malik Shazil**
Computer Engineering / Computer Science Student
Focus Areas:

* Digital Design
* Computer Architecture
* SystemVerilog & RTL

---

## 📜 License

This project is intended for **educational purposes**.


