module mult_generic #(parameter n = 18, parameter m = 36) (x, a, m1);
	input signed [n-1:0] x;
	input signed [m-1:0] a;
	output signed [59:0] m1;
	
	wire signed [m+n-1:0] temp;
	wire [5:0] sign_ext;	
	
	assign temp =  x * a;
	assign sign_ext = {6{temp[m+n-1]}};	
	assign m1 = {sign_ext, temp};
	
endmodule