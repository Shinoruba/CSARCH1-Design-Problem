# Design Problem Specification: 7-Segment Display Controller

## Overview
This project involves designing a digital circuit that outputs a specific sequence of numbers on a 7-segment display. The sequence to be displayed is:  
`[1, 1, 2, 2, 4, 2, 6, 4, 6, 4, A, 4, C, 6, 8, 8]`  
where `A` represents 10 and `C` represents 12. The sequence repeats indefinitely. The circuit includes a reset functionality (`R`) to restart the sequence from the beginning.

---

## Key Components

### 1. **State Table**
- **Inputs**:  
  - `R`: Reset signal (active high). When `R=1`, the sequence resets to the first element (`1`).  
  - Clock: Assumed to be always active (`1`) unless reset is triggered.  
- **Present State (Qn)**: 4-bit current state (`A, B, C, D`), representing 16 possible states.  
- **Next State (Qn+1)**: The state transitions follow the predefined sequence unless reset is active.  
- **Flip-Flop Inputs**: D flip-flops are used, where the inputs (`DA, DB, DC, DD`) directly correspond to the next state values.  

### 2. **Karnaugh Maps (K-Maps)**
K-Maps were used to derive the Sum of Products (SOP) equations for the D flip-flop inputs:  
- **DA**: `R'A'BCD + R'AB' + R'AC' + R'AD'`  
- **DB**: `R'B'CD + R'BC' + R'BD'`  
- **DC**: `R'C'D + R'CD'`  
- **DD**: `R'D'`  

These equations simplify the logic for transitioning between states.

### 3. **Logic Diagram**
The circuit is implemented using:  
- **D Flip-Flops**: To store the current state.  
- **Logic Gates**: AND and OR gates to implement the SOP equations.  
- **Splitter**: Combines 4-bit outputs from flip-flops into a single multi-bit signal.  
- **Decoder**: Converts the 4-bit state into specific outputs for the 7-segment display.  
- **7-Segment Display**: Displays the sequence, with segments controlled by OR gates connected to the decoder outputs.  

### 4. **Output Sequence**
The 7-segment display outputs the following sequence:  
1 → 1 → 2 → 2 → 4 → 2 → 6 → 4 → 6 → 4 → A (10) → 4 → C (12) → 6 → 8 → 8 → (repeat).  

Special cases:  
- `A` (10) is displayed as `A` (segment pattern: `1110111`).  
- `C` (12) is displayed as `C` (segment pattern: `0110001`).  

### 5. **Verilog Implementation**
The design is translated into Verilog code, including:  
- **Main Module**: `EulerTotient` with inputs (`R`, clock) and outputs (7-segment signals `A-G`).  
- **Submodules**:  
  - `DflipFlop`: Implements D flip-flop behavior.  
  - `Decoder16`: Decodes 4-bit input into 16 output lines for the 7-segment display.  
- **Testbench**: Simulates the sequence and verifies correct output patterns.  

---

## How to Run the Code
1. **Compile**:  
   ```bash
   iverilog -o Homssi_S14_DP.vvp Homssi_S14_DP.v Homssi_S14_DP_tb.v
   ```  
2. **Execute**:  
   ```bash
   vvp Homssi_S14_DP.vvp
   ```  
3. **Expected Output**:  
   The testbench displays the 7-segment outputs for each state in the sequence, including reset behavior.  

---

## Summary
This project demonstrates a finite state machine (FSM) that cycles through a predefined sequence, with reset capability, and displays the output on a 7-segment display. The design leverages K-Maps for logic optimization and Verilog for hardware implementation.
