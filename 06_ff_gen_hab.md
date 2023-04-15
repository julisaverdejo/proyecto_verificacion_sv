# 6. ff_gen_hab





```verilog
module ff_gen_hab #(parameter n  = 60) (rst, clk, hab, d, q);
	input rst, clk, hab;
	input [n-1:0] d;
	output [n-1:0] q;
	
	reg [n-1:0] qn, qp;
	
	assign qn = (hab == 0) ? qp : d; 
	
	always@(posedge clk, posedge rst) begin
		if(rst)
			qp <= 0;
		else
			qp <= qn;
	end

	assign q = qp;
	
endmodule
```

