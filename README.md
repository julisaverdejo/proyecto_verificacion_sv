# Verificación de arquitectura MAC
Autor: Julisa Verdejo Palacios



## 1. MAC (Multiply-Accumulator)

**1.1 Definición**





**1.2 Aplicaciones**





**1.3 Características**

* Trabaja con punto fijo
* 18 bits de entrada 
* 36 bits para coeficientes
* 60 bits para resultado parcial interno
* 18 bits de salida

![img](imagenes/mac.svg)

* ***x*** entrada
* ***a*** coeficientes
* ***n*** indica el número de coeficientes que se van a ingresar, o en otras palabras el número de multiplicaciones y sumas que se van a realizar.
* ***i*** direcciona a una memoria ROM donde se tienen almacenados los coeficientes, es decir, genera las direcciones.
  * La memoria ROM va conectada entre **a** e **i**.
* ***sft*** es la señal de inicio.
* ***clk*** es el reloj del sistema.
* ***rst*** es el reset del sistema.
* ***y*** es la salida.
* ***s*** permite mover el punto decimal en ***y***.
* ***eof*** bandera que indica si la operación ha terminado.



**1.4 Diagrama a bloques**



![img](imagenes/mac_bloques.svg)



## 2. Testbench



```verilog
`timescale 1 ns / 100 ps

module tb_mac ();
	reg rst, clk, stf, eof;
	reg [17:0] y;
	
	wire [35:0] a;
	wire [17:0] x;	 
	wire [5:0] i;	
	
	top_mac             DUT_mac    (rst, clk, stf, x, a, 6'b000010, 6'b011100, eof, i, y);
	rom_a    #(.n(36))  DUT_rom_a  (i, a);
	rom_x	 #(.n(18))  DUT_rom_x  (i, x);
	
	always #5 clk=~clk;
	
	initial begin
	clk = 0;
	rst = 1;
	stf = 0;
	
	#20
	rst = 0;	
	
	#40
	stf = 1;
	
	#20
	stf = 0;
		
	end

endmodule

```



![img](imagenes/simulacion.png)





## 3. Códigos

1. [01_mult_generic](01_mult_generic.md)
2. [02_sum_generic](02_sum_generic.md)
3. [03_ ff_gen_hab2](03_ff_gen_hab2.md)
4. [04_contador](04_contador.md)
5. [05_fsm_mac](05_fsm_mac.md)
6. [06_ff_gen_hab](06_ff_gen_hab.md)
7. [07_ajuste](07_ajuste.md)
8. [08_top_mac](08_top_mac.md)
9. [09_rom_a](09_rom_a.md)
10. [10_rom_x](10_rom_x.md)
11. [11_tb_mac](11_tb_mac.md)



















