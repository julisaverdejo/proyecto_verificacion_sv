module rom_x #(parameter n = 18) (direccion, valor);
	input reg [5:0] direccion;
	output reg [n-1:0] valor;
	
	always@(direccion)
		case(direccion)
			0 : valor = 18'b000001000000000000; 
			1 : valor = 18'b000001010000000000;
			2 :	valor = 18'b000001100000000000;
			default : valor = 0; 		
		endcase	
	
endmodule