module mod12_4bitload_binup_counter_tb;
  reg clk;
  reg reset;
  reg load;
  reg [3:0] data_in;
  wire [3:0] q;

  mod12_4bitload_binup_counter uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .data_in(data_in),
    .q(q)
  );

  // Clock generation: 10 time unit period
  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    reset = 0;
    load = 0;
    data_in = 4'b0000;
    
    $dumpfile("counter_simulation.vcd");
    $dumpvars(0, mod12_4bitload_binup_counter_tb);
    $display("Time\t RST\t LOAD\t  DATA_IN\t Q (Bin)\t ");
    $monitor("%0dt\t %b\t %b\t  %b\t\t %b", $time, reset, load, data_in, q);

    // --- 1. Apply Synchronous Reset ---
    #5;
    reset = 1;
    #10;            // Wait 1 clock cycle
    reset = 0;      // Turn off reset

    // Allow it to count naturally for a few cycles (0 -> 1 -> 2...)
    #30;

    // --- 2. Load the value 8 (4'b1000) ---
    data_in = 4'b1000;
    load = 1;       // Enable load
    #10;            // Wait exactly 1 clock cycle for the design to sample it
    load = 0;       // FIX: Turn load OFF so the counter can increment from 8!

    // Let it count up from 8 naturally (8 -> 9 -> 10 -> 11 -> 0 -> 1...)
    #60;

    // --- 3. Load the value 11 (4'b1011) to test the rollover condition ---
    data_in = 4'b1011;
    load = 1;       // Enable load
    #10;            // Wait exactly 1 clock cycle
    load = 0;       // FIX: Turn load OFF

    // Let it run for a couple cycles to watch 11 roll over back to 0
    #30;
    
    $display("Simulation successfully complete.");
    $finish;
  end
endmodule

