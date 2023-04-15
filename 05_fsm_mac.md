# 5. fsm_mac





```verilog
module fsm_mac (rst, clk, stf, z, lda, ldr, eof, opc);
	input rst, clk, stf, z;
	output reg [1:0] lda;
	output reg ldr, eof;
	output reg [1:0] opc;
	
	reg [2:0] qp, qn;
	
	always@(qp, stf, z) begin
		case(qp)
			0 : begin
				opc = 3; lda = 0; ldr = 0; eof = 1;
				if(stf)
					qn = 1;
				else
					qn = qp;
				end
			
			1 :	begin
				opc = 1; lda = 1; ldr = 0; eof = 0;
				qn = 2;
				end
			
			2 : begin
				opc = 1; lda = 2; ldr = 0; eof = 0;
				if(z)
					qn = 4;
				else
					qn = 3;
				end
			
			3 : begin
				opc = 2; lda = 2; ldr = 0; eof = 0;
				qn = 1;
				end
			
			4 : begin
				opc = 0; lda = 2; ldr = 1; eof = 0;
				qn = 0;
				end
			
			default : begin
				      opc = 0; lda = 0; ldr = 0; eof = 0; 
				      qn = 0;
					  end
		endcase
	end	
	
	always@(posedge rst, posedge clk) begin
		if(rst)
			qp <= 0;
		else
			qp <= qn;		
	end
	
endmodule
```

