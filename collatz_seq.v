module collatz_seq;
integer num;
initial begin
  num=13;
  while(num!=1)begin
   $display("%d",num);
   if(num%2==0)begin
      num=num/2;
   end
   else begin
     num=num*3+1;
    end
  end
$display("%d",num);
end
endmodule
