module n_bit_to_gray_tb;

parameter n = 4;

reg  [n-1:0] in;
reg  [n-1:0] expected;
wire [n-1:0] y;

n_bit_to_gray dut (
    .in(in),
    .y(y)
);

task check;
begin
    if (expected === y)
        $display("PASS : in=%b expected=%b y=%b", in, expected, y);
    else
        $display("FAIL : in=%b expected=%b y=%b", in, expected, y);
end
endtask

initial
begin
    in = 4'b0011;
    expected = 4'b0010;
    #10;
    check;

    in = 4'b1111;
    expected = 4'b1000;
    #10;
    check;

    #30;
    $display("END OF TEST");
    $finish;
end

endmodule



















```verilog
module n_bit_to_gray_tb;

parameter n = 4;

reg  [n-1:0] in;
reg  [n-1:0] expected;
wire [n-1:0] y;

integer i;

// DUT
n_bit_to_gray #(n) dut (
    .in(in),
    .y(y)
);

// Self-checking task
task check;
begin
    if (expected === y)
        $display("PASS : in=%b expected=%b y=%b",
                  in, expected, y);
    else
        $display("FAIL : in=%b expected=%b y=%b",
                  in, expected, y);
end
endtask

// Test all possible inputs
initial begin

    for (i = 0; i < (1 << n); i = i + 1) begin

        in = i;

        // Calculate expected Gray code
        expected = in ^ (in >> 1);

        #10;

        check;

    end

    $display("END OF TEST");
    $finish;

end

endmodule
```


