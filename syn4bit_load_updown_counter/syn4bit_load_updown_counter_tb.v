`timescale 1ns/1ps

module syn4bit_load_updown_counter_tb;

  // Testbench signals
  reg clk;
  reg reset;
  reg load;
  reg updown;
  reg [3:0] data_in;
  wire [3:0] count;

  // Instantiate DUT
  syn4bit_load_updown_counter uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .updown(updown),
    .data_in(data_in),
    .count(count)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test sequence
  initial begin

    // Initial values
    clk = 0;
    reset = 0;
    load = 0;
    updown = 1;
    data_in = 4'b0000;

    // Reset
    #10;
    reset = 1;
    #10;
    reset = 0;

    // Load 1010
    load = 1;
    data_in = 4'b1010;
    #10;
    load = 0;

    // Up counting
    updown = 1;
    #50;

    // Down counting
    updown = 0;
    #50;

    // Finish simulation
    $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time=%0t | reset=%b load=%b updown=%b data_in=%b count=%b",
              $time, reset, load, updown, data_in, count);
  end

endmodule
 
  
