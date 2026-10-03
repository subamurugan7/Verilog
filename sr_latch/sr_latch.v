module sr_latch(input s,r,
     output q,qb
);
nor (q,r,qb);
nor(qb,s,q);
endmodule
