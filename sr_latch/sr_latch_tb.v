module sr_latch_tb();
reg s,r;
wire q,qb;
sr_latch dut(.s(s),.r(r),.q(q),.qb(qb)
);
initial begin
 s=0;r=0;#10;
 s=1;r=0;#10;
 s=0;r=0;#10;
 s=0;r=1;#10;
 s=0;r=0;#10;
 s=1;r=1;#10;
 s=0;r=0;#10;
$finish;
end
initial
begin 
$monitor("time=%0t s=%b r=%b d=%b qb=%b",$time,s,r,q,qb);
end
endmodule