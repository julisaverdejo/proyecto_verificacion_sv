# 2. sum_generic

- Descripción: En este código se implementa la suma entre dos números.
- Código:

```verilog
module sum_generic #(parameter n = 60) (q, p, s);
	input signed [n-1:0] q, p;
	output signed [n-1:0] s;
	
	assign s = p + q;	
	
endmodule
```

- [x] Síntesis
