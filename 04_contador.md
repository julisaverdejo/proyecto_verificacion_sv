# 4. contador





```verilog
module contador #(parameter m = 6) (rst, clk, opc, n, z, i);
	input rst,clk;
	input [1:0] opc;
	input [m-1:0] n;
	output z;
	output [m-1:0] i;
	
	reg [m-1:0] qp, qn;
	
	always@(opc)
		case(opc)
			0 : qn = 0; 
			1 : qn  = qp;
			2 : qn = qp -1;
			3 : qn = n;
			default : qn = qp;			
		endcase
		
	assign z = (qp == 0)? 1:0;
	
	always@(posedge clk, posedge rst)
		begin
			if(rst)
				qp <= 0;
			else
				qp <= qn;
		end
	
	assign i = qp;
	
endmodule
```

