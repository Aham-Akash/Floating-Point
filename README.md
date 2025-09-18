# Floating-Point
# Verilog Floating-Point Adder
This repository contains the Verilog code for a simple floating-point adder and a corresponding testbench to verify its functionality.

## Table of Contents
- [Project Description](#project-description)
- [File Structure](#file-structure)
- [Module: FltPt](#module-siso)
- [Testbench: FltPt_tb](#testbench-siso_tb)
- [How to Simulate](#how-to-simulate)

## Project Description
A floating-point adder is a digital circuit that performs addition on two 32-bit floating-point numbers. This implementation is a crucial component in digital signal processing and other applications that require high-precision arithmetic.
The core behavior is as follows:
The module takes two 32-bit floating-point numbers as input.
It performs the addition operation.
The result is a 32-bit floating-point number.

## File Structure
The repository contains the following files:
FltPt.v: The synthesizable Verilog module for the floating-point adder.
FltPt_tb.v: The testbench used to simulate and verify the FltPt.v module. 

### Module: FltPt
This file defines the FltPt module.
### Ports
i_a (Input): A 32-bit input for the first floating-point number. 
i_b (Input): A 32-bit input for the second floating-point number. 
o_result (Output): A 32-bit output for the resulting floating-point number. 

### Functionality
The FltPt module takes two 32-bit floating-point numbers, i_a and i_b, and outputs their sum as a 32-bit floating-point number, o_result. 

### Testbench: FltPt_tb
This file (FltPt_tb.v) instantiates the FltPt module (as FltPt_INST) and provides stimuli to verify its correct operation. 

### Test Sequence
The testbench runs through a series of test cases to verify the functionality of the floating-point adder.
The test cases include:
Addition of positive numbers (2.9 + 2.8) 
Addition of a decimal and a whole number (0.5 + 4.5) 
Addition of a negative and a positive number (-2.9 + 5.8) 
Addition of small, subnormal values 
A case involving infinity 
A case involving NaN (Not a Number) 

## How to Simulate
To run the simulation, you will need a Verilog simulator such as ModelSim, Vivado, or an open-source tool like Icarus Verilog.
Compile both FltPt.v and FltPt_tb.v.
Set FltPt_tb as the top-level module for the simulation.
Run the simulation.
You can observe the signals (especially i_a, i_b, and o_result) in a waveform viewer to confirm that the output data (o_result) matches the expected results for each test case. The testbench will also monitor and display the values of A, B, and the Result at each time step. 
