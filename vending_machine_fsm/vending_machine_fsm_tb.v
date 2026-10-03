module vending_machine_fsm_tb;
 reg clk,rst;
 reg [1:0] din;
 wire p_dout,return;
 vending_machine_fsm dut(.clk(clk),.rst(rst),.din(din),.p_dout(p_dout),.return(return));
always
#5 clk=~clk;
initial begin
  clk=0;
  rst=1;
  din=2'b00;
  #10
  rst=0;
  #10 din=2'b01;
  #10 din=2'b10;
  #10 din=2'b01;
 #20 $finish;
end
initial
$monitor("time=%0t clk=%b rst=%b din=%b p_dout=%b return=%b",$time,clk,rst,din,p_dout,return);
endmodule
  
 
