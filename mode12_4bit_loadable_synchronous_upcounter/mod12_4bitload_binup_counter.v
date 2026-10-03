module mod12_4bitload_binup_counter(
   input wire clk,
   input wire reset,
   input wire load,
   input  wire [3:0] data_in,
   output reg [3:0] q
);
always@(posedge clk) begin
   if(reset)begin
     q<=4'b0000;
   end
   else if(load) begin
      q<=data_in;
   end
   else  begin
     if(q==4'b1011) begin
       q<=4'b0000;
     end
     else begin
       q<=data_in+1;
     end
  end
end
endmodule
        

