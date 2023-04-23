# Verificación de arquitectura MAC en SV.
Autor: Julisa Verdejo Palacios



***Resumen:*** 





## 1. Verificación

Definición

objetivo de la verificación

testing at different levels

plan de verificación



##  2. SystemVerilog

Definición

indicar que se trata de programación orientada a objetos

### 2.1 Modelo de verificación en SV



#### 2.1.1 Environment

Contiene todos los componentes de verificación mencionados

importa el orden en el que se incluyan las clases

1- generador

2- driver

#### 2.1.2 Generator

randomize the input values



Esta clase se encarga de generar estímulos necesarios para controlar el DUT. 

- En esta clase se instancia la clase transaction y se define como aleatoria. 
- La clase generator se conecta a la clase driver por medio de un mailbox. 

Sintaxis:

```systemverilog
class generator;
    
    //declaracion de la clase transaction
    //declaracion de mailbox
    //generación de task
    //repeat count to specify number of items to generate
    //declaración de event
    //constructor
    //main task
    //packets and puts into mailbox
    
endclass 
```



#### 2.1.3 Transaction

Esta clase contiene todas las señales del DUT que son requeridas para generar estímulos.

Sintaxis:

```systemverilog
class transaction;
    ...
    transaction_items
    ...
endclass
```

En la clase transaction se ponen restricciones

#### 2.1.4 Driver

Drives the generated stimulus to the design

drive the data from the generator and send data to the DUT

#### 2.1.5 Scoreboard

checks output from the design with expected behavior

hace lo que el circuito está haciendo

se necesita una copia aquí y se debe ir actualizando



#### 2.1.6 Monitor

Monitor the design input-output ports to capture design activity

#### 2.1.7 Testbench



#### 2.1.8 Interface

Es un bloque que agrupa en un solo puerto todas las entradas y salidas del dispositivo bajo prueba (DUT) que pueden ser controladas y supervisadas.

Ventajas:

- Se utiliza para conectar el dispositivo con otros bloques usados en la verificación.

- Reduce errores que pueden producirse durante las conexiones de los módulos

- Pueden añadirse o eliminarse señales con facilidad.

Sintaxis:

```systemverilog
interface nombre_interface;
    ...
    interface_items
    ...
endinterface
```



> Nota: 
>
> Un `interface` puede ser parametrizado con la directiva `parameter`.



#### 2.1.9 Test

contains the environment that can be changed with different configuration settings



### 2.2 Tipos de datos

logic

rand bit

bit



# Software para verificación en SV



## 3. Active HDL

 











# Dispositivo a verificar



## 4. MAC (Multiply-Accumulator)



### 4.1 Aplicaciones

### 4.2 Características

* Trabaja con [punto fijo](fixed_point.md)
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







![img](imagenes/mac_bloques.svg)



| Variable | Número de bits | Formato      | Mover Punto | Rangos $[-2^{a}, 2^{a} - 2^{-b}]$ |
| -------- | -------------- | ------------ | ----------- | --------------------------------- |
| $X$      | $18$ bits      | $A(7,10)$    | $10$        | $[ -128.000000, 127.999023]$      |
| $A$      | $36$ bits      | $X(7,28)$    | $28$        | $[ -128.0, 128.0 ]$               |
| $P$      | $60$ bits      | $P(14+7,38)$ | $38$        | $[ -2097152.0, 2097152.0  ]$      |
| $Q$      | $60$ bits      | $Q(14+7,38)$ | $38$        | $[ -2097152.0, 2097152.0  ]$      |
| $U$      | $60$ bits      | $U(14+7,38)$ | $38$        | $[ -2097152.0, 2097152.0  ]$      |
| $R$      | $60$ bits      | $R(14+7,38)$ | $38$        | $[ -2097152.0, 2097152.0  ]$      |





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



### 4.3 Códigos

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



# Verificación de arquitectura MAC



## 5. Códigos



## Referencias













