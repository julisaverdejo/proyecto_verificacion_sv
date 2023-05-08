# 3. ff_gen_hab2

- Descripción: En este código de describe el funcionamieto de un flip-flop genérico con habilitación.
- Código:

```verilog
module ff_gen_hab2 #(parameter n = 60) (rst, clk, hab, d, q);
	input rst, clk;
	input [1:0] hab;
	input [n-1:0] d;
	output [n-1:0] q;
	
	reg [n-1:0] qn, qp;
	
	always@(hab) begin
		case(hab)
			0 : qn = 0; 
			1 : qn = d; 
			default : qn = qp;
		endcase
	end
	
	always@(posedge clk, posedge rst) begin
		if(rst)
			qp <= 0;
		else
			qp <= qn;	
	end
	
	assign q = qp;
		
endmodule
```



- [x] Síntesis
