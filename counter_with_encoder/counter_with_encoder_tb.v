module counter_with_encoder_tb;

reg clk;
reg reset;
wire [3:0] count;
wire [1:0] out;

counter_with_encoder dut (
    .clk(clk),
    .reset(reset),
    .count(count),
    .out(out)
);

always #5 clk = ~clk;


// TASK + SELF CHECK
task check_encoder;
    input [3:0] expected_count;
    input [1:0] expected_out;

    begin
        #1;

        if ((count === expected_count) &&
            (out === expected_out))

            $display("PASS : count=%b out=%b",
                     count, out);

        else

            $display("FAIL : count=%b out=%b expected_count=%b expected_out=%b",
                     count, out,
                     expected_count, expected_out);
    end
endtask


initial begin

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    @(posedge clk);
    #1;
    check_encoder(4'b0001, 2'b00);

    @(posedge clk);
    #1;
    check_encoder(4'b0010, 2'b01);

    @(posedge clk);
    #1;
    check_encoder(4'b0011, 2'bxx);

    @(posedge clk);
    #1;
    check_encoder(4'b0100, 2'b10);

    @(posedge clk);
    #1;
    check_encoder(4'b0101, 2'bxx);

    @(posedge clk);
    #1;
    check_encoder(4'b0110, 2'bxx);

    @(posedge clk);
    #1;
    check_encoder(4'b0111, 2'bxx);

    @(posedge clk);
    #1;
    check_encoder(4'b1000, 2'b11);

    #10;
    $finish;

end

endmodule
