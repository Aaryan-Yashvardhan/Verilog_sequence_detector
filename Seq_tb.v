`include "Seq.v"
module tb_Sequence_Detector_Moore_FSM_Verilog;

  // Inputs
  reg sequence_in;   // Input sequence
  reg clock;         // Clock signal
  reg reset;         // Reset signal

  // Outputs
  wire detector_out; // Output of the sequence detector

  parameter CLK_PERIOD = 10; // Clock period in time units

  // Instantiate the Sequence Detector using Moore FSM
  Sequence_Detector_MOORE_Verilog uut (
    .sequence_in(sequence_in),
    .clock(clock),
    .reset(reset),
    .detector_out(detector_out)
  ); 

  always #((CLK_PERIOD)/2) clock = ~clock;

  initial begin
    clock = 0;

  end 

  initial begin
    // Initialize Inputs
    $dumpfile("Seq_tb.vcd");
    $dumpvars(0, tb_Sequence_Detector_Moore_FSM_Verilog);

    sequence_in = 0;
    reset = 1;

    // Wait 100 ns for global reset to finish
    #10;
    reset = 0;

    #40;
    sequence_in = 1;
    #10;
    sequence_in = 0;
    #10;
    sequence_in = 1; 
    #10;
    sequence_in = 0; 
    #10;
    sequence_in = 0; 
    #10;
    sequence_in = 1;  
    #10;
    sequence_in = 1;  
    #10;
    sequence_in = 0;
    #10;
    sequence_in = 1;
    #10;
    sequence_in = 0; 
    #10;
    sequence_in = 0; 
    #10;
    sequence_in = 1; 
    #10;
    sequence_in = 1;  
    #10;
    sequence_in = 0;  
    #10;

    $finish;
  end
endmodule
