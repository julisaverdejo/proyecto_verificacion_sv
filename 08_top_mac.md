# 8. top_mac

- Descripción:
- Código:

```verilog
module top_mac(rst, clk, stf, x, a, n, s, eof, i, y);
	input rst, clk, stf;
	input [17:0] x;
	input [35:0] a;
	input [5:0] n;
	input [5:0] s;
	output eof;
	output [5:0] i;
	output [17:0] y;
	
	wire [59:0] p, q, u, r;
	wire ldr, z;
	wire [1:0] opc, lda;
	
	mult_generic #(.n(18), .m(36)) mod_mult_generic (x, a, p);
	sum_generic  #(.n(60))         mod_sum_generic  (q, p, u); 
	ff_gen_hab2  #(.n(60))		   mod_ff_gen_hab2	(rst, clk, lda, u, q);
	contador	 #(.m(6))		   mod_contador     (rst, clk, opc, n, z, i);
	fsm_mac		 				   mod_fsm_mac      (rst, clk, stf, z, lda, ldr, eof, opc); 
	ff_gen_hab   #(.n(60))		   mod_ff_gen_hab   (rst, clk, ldr, q, r);
	ajuste      				   mod_ajuste       (r, s, y);
	
	
	
endmodule
```

