module rom_a #(parameter n = 36) (direccion, valor);
	input reg [5:0] direccion;
	output reg [n-1:0] valor;
	
	always@(direccion)
		case(direccion)
			0 : valor = 36'b000000010000000000000000000000000000; 
			1 : valor = 36'b000000100000000000000000000000000000;
			2 :	valor = 36'b000000110000000000000000000000000000;
			default : valor = 0; 		
		endcase	
	
endmodule