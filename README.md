Title: Verilog Sequence Detector using Finite State Machine

Objective: Design a sequence detector circuit using a Finite State Machine in Verilog.

Implementation:

Define Finite State Machine states: Zero, One, OneZero, OneZeroZero, OneZeroZeroOne.
Sequential logic: Current and next state storage.
Combinational logic: Determine the next state based on the current state and input sequence.
Output generation: Output value based on the current state.

Testbench:
Initialize inputs: sequence_in, clock, reset.
Simulate clock signal.
Apply input sequence and reset signal.
Used GTKWave for waveform analysis and verification.

Introduction:
This project focuses on implementing a sequence detector using a Finite State Machine in Verilog. The objective is to design a circuit that can detect a specific input sequence and generate an output based on the current state. The project leverages fundamental digital logic design concepts, sequential circuits, and Verilog coding.

Implementation Details:
The project consists of two main modules: the Sequence Detector and its testbench. 
The Sequence Detector module defines the states, inputs, and outputs of the Finite State Machine. 
It includes sequential memory for storing the current and next states, as well as combinational logic for determining the next state based on the current state and input sequence. 
The testbench module initializes the inputs, simulates the circuit behaviour, and verifies the output using simulation tools like GTKWave.




