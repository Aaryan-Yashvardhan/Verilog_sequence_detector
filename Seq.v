/*Summary:
This project implements a Sequence Detector using a Finite State
 Machine (FSM) in Verilog. It aims to detect a specific input
sequence and generate an output based on the current state. 
The design includes a Sequence Detector module with sequential
 memory and combinational logic to determine the next state
  and output.
*/

module Sequence_Detector_MOORE_Verilog(
  sequence_in, // binary input
  clock,       // clock signal
  reset,       // reset input
  detector_out // output of the sequence detector
);
  input clock;                     // clock signal
  input reset;                     // reset input
  input sequence_in;               // binary input
  output reg detector_out;         // output of the sequence detector
  
  parameter Zero = 4'b0000,        // "Zero" State
            One = 4'b0001,         // "One" State
            OneZero = 4'b0010,     // "OneZero" State
            OneZeroZero = 4'b0100, // "OneZeroZero" State
            OneZeroZeroOne = 4'b1001; // "OneZeroZeroOne" State
  
  reg [3:0] current_state, next_state; // current state and next state
  
  // Sequential memory of the Finite State Machine
  always @(posedge clock, posedge reset)
  begin
  
    if (reset == 1) 
      current_state <= Zero;    // When reset = 1, reset the state of the Finite State Machine to "Zero" State
    else
      current_state <= next_state; // Otherwise, transition to the next state
  end
  
  always @(current_state, sequence_in)
  begin
    case (current_state)
      Zero:
        begin
          // Transition from "Zero" state
          // If sequence_in is 1, transition to "One" state
          // Otherwise, remain in "Zero" state
          if (sequence_in == 1)
            next_state = One;
          else
            next_state = Zero;
        end
      One:
        begin
          // Transition from "One" state
          // If sequence_in is 0, transition to "OneZero" state
          // Otherwise, remain in "One" state
          if (sequence_in == 0)
            next_state = OneZero;
          else
            next_state = One;
        end
      OneZero:
        begin
          // Transition from "OneZero" state
          // If sequence_in is 0, transition to "OneZeroZero" state
          // Otherwise, remain in "One" state
          if (sequence_in == 0)
            next_state = OneZeroZero;
          else
            next_state = One;
        end
      OneZeroZero:
        begin
          // Transition from "OneZeroZero" state
          // If sequence_in is 0, transition to "Zero" state
          // Otherwise, transition to "OneZeroZeroOne" state
          if (sequence_in == 0)
            next_state = Zero;
          else
            next_state = OneZeroZeroOne;
        end
      OneZeroZeroOne:
        begin
          // Transition from "OneZeroZeroOne" state
          // If sequence_in is 0, transition to "OneZero" state
          // Otherwise, remain in "One" state
          if (sequence_in == 0)
            next_state = OneZero;
          else
            next_state = One;
        end
      default:
        next_state = Zero;
    endcase
  end
  
  // Combinational logic to determine the output of the Finite State Machine
  // The output only depends on the current state
  always @(current_state)
  begin
    case (current_state)
      Zero:
        detector_out = 0;
      One:
        detector_out = 0;
      OneZero:
        detector_out = 0;
      OneZeroZero:
        detector_out = 0;
      OneZeroZeroOne:
        detector_out = 1;
      default:
        detector_out = 0;
    endcase
  end
endmodule
