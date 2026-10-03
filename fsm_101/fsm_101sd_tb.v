module fsm_101sd_tb;
 reg clk;
 reg rst;
 reg din;
 wire dout;
fsm_101sd dut(.clk(clk),.rst(rst),.din(din),.dout(dout));
always 
#5 clk=~clk;
initial begin
  clk=0;
  rst=1;
  din=0;
  #10 rst=0;
  #10 din=1;
  #10 din=0;
  #10 din=1;
  #20  $finish;
end
initial
$monitor("time=%0t rst=%b din=%b  state=%b dout=%b",$time,rst,din,dut.state,dout);
endmodule



